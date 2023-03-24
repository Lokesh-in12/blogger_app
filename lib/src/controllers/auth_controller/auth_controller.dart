import 'package:blogger_app/core/exceptions/firebase_auth_exceptions.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/models/UserModel/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  //variables
  final _auth = FirebaseAuth.instance;
  final _dbRef = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;

  FirebaseAuth get auth => _auth;

  // @override
  // void onReady() {
  //   firebaseUser = Rx<User?>(_auth.currentUser);
  //   firebaseUser.bindStream(_auth.userChanges());
  //   ever(firebaseUser, _setInitialScreen);
  // }

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    user == null ? isLoggedIn.value = false : isLoggedIn.value = true;
  }

  Future<bool?> createUserWithEmailAndPass(String email, String password,
      UserModel userModel, String uniqueId) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // await _dbRef.collection('Users').add(userModel.toJson());
      await _dbRef.collection('Users').doc(uniqueId).set(userModel.toJson());
      if (kDebugMode) {
        print("created and added!");
      }
      firebaseUser.value != null
          ? isLoggedIn.value = true
          : isLoggedIn.value = false;

      Fluttertoast.showToast(
          msg: "Successfully Created User!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      return true;
    } on FirebaseAuthException catch (e) {
      // ignore: unused_local_variable
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTIONS - ${ex.message}');
      }
      Fluttertoast.showToast(
          msg: ex.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        print("EXCEPTION - ${ex.message}");
      }
      Fluttertoast.showToast(
          msg: ex.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      throw ex;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  Future<bool?> LoginUserWithEmailAndPass(
      String email, String password, BuildContext ctx) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      await Fluttertoast.showToast(
          msg: "Successfully LoggedIn!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // ignore: use_build_context_synchronously
      ctx.goNamed(AppRouteConsts.home);
      isLoggedIn.value = true;
      return true;
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTIONS - ${ex.message}');
      }
      Fluttertoast.showToast(
          msg: ex.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        print("EXCEPTION - ${ex.message}");
      }
      Fluttertoast.showToast(
          msg: ex.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw ex;
    }
    return null;
  }

  //signOut
  Future<void> logOut(BuildContext context) async {
    await _auth.signOut().then((value) {
      isLoggedIn.value = false;
      // context.goNamed(AppRouteConsts.signIn);
    });
    // ignore: use_build_context_synchronously
    // ignore: use_build_context_synchronously
  }
}
