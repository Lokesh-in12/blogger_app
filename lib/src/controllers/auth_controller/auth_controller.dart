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
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nanoid/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  //variables
  final _auth = FirebaseAuth.instance;
  final _dbRef = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  FirebaseAuth get auth => _auth;

  Future<void> removePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  //googelOauthController
  final googleSignIn = GoogleSignIn();
  final googleAccount = Rx<GoogleSignInAccount?>(null);

  Future<void> googleLoin() async {
    String uniqueId = await nanoid(7);
    try {
      googleAccount.value = await googleSignIn.signIn();
      isLoggedIn(true);

      UserModel data = UserModel(
          email: googleAccount.value!.email,
          id: uniqueId,
          username: googleAccount.value!.displayName);

      await _dbRef.collection('Users').doc(uniqueId).set(data.toJson());
    } on FormatException catch (e) {
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> googleLogout() async {
    googleAccount.value = await googleSignIn.signOut();
    isLoggedIn.value = false;
    await removePref();
  }

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
    print("_setInitialScreen ran");
    // user == null ? isLoggedIn.value = false : isLoggedIn.value = true;
    if(user == null){
      isLoggedIn(false);
      Get.offAllNamed(AppRouteConsts.signIn);
    }else{
      isLoggedIn(true);
      Get.offAllNamed(AppRouteConsts.home);
    }
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
  Future<void> logOutEmail(BuildContext context) async {
    await _auth.signOut();
    await removePref();
    isLoggedIn.value = false;
  }
}
