import 'package:blogger_app/core/exceptions/firebase_auth_exceptions.dart';
import 'package:blogger_app/src/models/UserModel/user_model.dart';
import 'package:blogger_app/src/views/screens/homescreen/home_screen.dart';
import 'package:blogger_app/src/views/screens/welcomeScreen/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  //variables
  final _auth = FirebaseAuth.instance;
  final _dbRef = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    // user == null
    //     ? Get.offAll(() => const WelcomeScreen())
    //     : Get.offAll(() => const HomeScreen());
    // user == null ?

    user == null ? isLoggedIn.value = false : isLoggedIn.value = true;
  }

  Future<bool?> createUserWithEmailAndPass(
      String email, String password, UserModel userModel) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _dbRef.collection('Users').add(userModel.toJson());
      print("created and added!");
      firebaseUser.value != null
          ? isLoggedIn.value = true
          : isLoggedIn.value = false;

      FlutterToastAlert.showToastAndAlert(
          type: Type.Success,
          iosTitle: "User Created!",
          iosSubtitle: "Proceed To Login",
          androidToast: "User Created!",
          toastDuration: 3,
          toastShowIcon: true);
      return true;
    } on FirebaseAuthException catch (e) {
      // ignore: unused_local_variable
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTIONS - ${e.message}');
      }
      FlutterToastAlert.showToastAndAlert(
          type: Type.Error,
          iosTitle: "Ooops",
          iosSubtitle: e.message.toString(),
          androidToast: e.message.toString(),
          toastDuration: 3,
          toastShowIcon: true);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        print("EXCEPTION - ${ex.message}");
      }
      FlutterToastAlert.showToastAndAlert(
          type: Type.Error,
          iosTitle: "Ooops",
          iosSubtitle: ex.message.toString(),
          androidToast: ex.message.toString(),
          toastDuration: 3,
          toastShowIcon: true);
      throw ex;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  Future<bool?> LoginUserWithEmailAndPass(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      FlutterToastAlert.showToastAndAlert(
          type: Type.Success,
          iosTitle: "Successfully LoggedIn!",
          iosSubtitle: "",
          androidToast: "Successfully LoggedIn!",
          toastDuration: 3,
          toastShowIcon: true);
      isLoggedIn.value = true;
      return true;
    } on FirebaseAuthException catch (e) {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Error,
          iosTitle: "Ooops",
          iosSubtitle: e.message.toString(),
          androidToast: e.message.toString(),
          toastDuration: 3,
          toastShowIcon: true);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        print("EXCEPTION - ${ex.message}");
      }
      FlutterToastAlert.showToastAndAlert(
          type: Type.Error,
          iosTitle: "Ooops",
          iosSubtitle: ex.message.toString(),
          androidToast: ex.message.toString(),
          toastDuration: 3,
          toastShowIcon: true);
      throw ex;
    }
  }

  Future<void> logOut() async => await _auth.signOut();
}
