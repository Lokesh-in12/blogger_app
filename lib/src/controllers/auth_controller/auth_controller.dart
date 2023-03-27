import 'package:bcrypt/bcrypt.dart';
import 'package:blogger_app/core/exceptions/firebase_auth_exceptions.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:blogger_app/src/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:blogger_app/src/models/UserModel/user_model.dart';
import 'package:blogger_app/src/views/widgets/toast/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nanoid/async.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  //signInController
  final signInController = Get.put(SignInController());
  //signUpController
  final signUpController = Get.put(SignUpController());

  //variables
  final _auth = FirebaseAuth.instance;
  final _dbRef = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  FirebaseAuth get auth => _auth;
  RxBool isLoading = false.obs;
  //googelOauthController
  final googleSignIn = GoogleSignIn();
  final googleAccount = Rx<GoogleSignInAccount?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  Future<void> removePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

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
      await customToast(e.message, true);
    }
  }

  Future<void> googleLogout(BuildContext ctx) async {
    googleAccount.value = await googleSignIn.signOut();
    isLoggedIn.value = false;
    // await removePref();
    // ignore: use_build_context_synchronously
    ctx.goNamed(AppRouteConsts.signIn);
  }

  void _setInitialScreen(User? user) {
    user == null ? isLoggedIn.value = false : isLoggedIn.value = true;
  }

  Future<void> createUserWithEmailAndPass(BuildContext ctx) async {
    if (signUpController.validEmail.value &&
        signUpController.validPass.value &&
        signUpController.validPhoneNo.value &&
        signUpController.validUsername.value) {
      try {
        isLoading(true);
        await _auth.createUserWithEmailAndPassword(
            email: signUpController.email.text.trim(),
            password: signUpController.password.text.trim());
        final uniqueId = await nanoid(12);

        final hashedPass = BCrypt.hashpw(
            signUpController.password.text.trim(), BCrypt.gensalt());

        UserModel data = UserModel(
            email: signUpController.email.text.trim(),
            username: signUpController.name.text.trim(),
            phoneNo: signUpController.phoneNo.text.trim(),
            hashPass: hashedPass,
            id: uniqueId);

        await _dbRef.collection('Users').doc(uniqueId).set(data.toJson());
        if (kDebugMode) {
          print("created and added!");
        }

        await customToast("Successfully Created User!", false);
      } on FirebaseAuthException catch (e) {
        // ignore: unused_local_variable
        final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
        if (kDebugMode) {
          print('FIREBASE AUTH EXCEPTIONS - ${ex.message}');
        }
        await customToast(ex.message, true);
      } catch (_) {
        isLoading(false);
        const ex = SignUpWithEmailAndPasswordFailure();
        if (kDebugMode) {
          print("EXCEPTION - ${ex.message}");
        }
        await customToast(ex.message, true);
        throw ex;
      } finally {
        isLoading(false);
        ctx.pushNamed(AppRouteConsts.signIn);
      }
    } else {
      customToast("Please fill all the field!", true);
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> LoginUserWithEmailAndPass(BuildContext ctx) async {
    if (signInController.validEmail.value && signInController.validPass.value) {
      try {
        isLoading(true);
        await _auth.signInWithEmailAndPassword(
            email: signInController.email.text.trim(),
            password: signInController.password.text.trim());
        await customToast("Successfully LoggedIn!", false);

        //empty fields
        signInController.email.clear();
        signInController.password.clear();

        // ignore: use_build_context_synchronously
        isLoggedIn.value = true;
        // ignore: use_build_context_synchronously
        ctx.goNamed(AppRouteConsts.home);
      } on FirebaseAuthException catch (e) {
        isLoading(false);
        final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
        if (kDebugMode) {
          print('FIREBASE AUTH EXCEPTIONS - ${ex.message}');
        }
        await customToast(ex.message, true);
      } catch (_) {
        isLoading(false);
        const ex = SignUpWithEmailAndPasswordFailure();
        if (kDebugMode) {
          print("EXCEPTION - ${ex.message}");
        }
        await customToast(ex.message, true);
        throw ex;
      } finally {
        isLoading(false);
      }
    } else {
      customToast("Please Fill all The Filed", true);
    }
  }

  //signOut
  Future<void> logOutEmail(BuildContext ctx) async {
    try {
      isLoading(true);
      await _auth.signOut();
      isLoggedIn(false);
      // ignore: use_build_context_synchronously
      ctx.goNamed(AppRouteConsts.signIn);
      // await removePref();
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      await customToast(e.message.toString(), true);
    } finally {
      isLoading(false);
    }
  }
}
