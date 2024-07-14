import 'package:doc_saver_app/helper/snackbar_helper.dart';
import 'package:doc_saver_app/screen/authentication_screen.dart';
import 'package:doc_saver_app/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  void setState() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  bool _isTroggole = true;
  bool get isTroggole => _isTroggole;
  setTroggole() {
    _isTroggole = !isTroggole;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setIsloading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  signUp(BuildContext context,
      {required String email, required String password}) async {
    try {
      setIsloading(true);
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        setIsloading(false);
        SnackbarHelper.showSuccessMessage(context, "Sign Up is Successfull");
        Navigator.of(context).pushNamed(HomeScreen.routeName);
        return value;
      });
    } on FirebaseAuthException catch (firebaseError) {
      setIsloading(false);
      SnackbarHelper.showErrorMessage(
          context, firebaseError.message.toString());
    } catch (error) {
      SnackbarHelper.showErrorMessage(context, error.toString());
    }
  }

  signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      setIsloading(true);
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        setIsloading(false);
        SnackbarHelper.showSuccessMessage(context, "Login is SuccessFull");
        Navigator.of(context).pushNamed(HomeScreen.routeName);
        return value;
      });
    } on FirebaseAuthException catch (firebaseError) {
      setIsloading(false);
      SnackbarHelper.showErrorMessage(
          context, firebaseError.message.toString());
    } catch (error) {
      setIsloading(false);
      SnackbarHelper.showErrorMessage(context, error.toString());
    }
  }

  bool _forgotPassLoading = false;
  bool get forgotPassLoad => _forgotPassLoading;
  setForgot(bool value) {
    _forgotPassLoading = value;
    notifyListeners();
  }

  forgotPassword(BuildContext context, String email) async {
    try {
      setForgot(true);
      await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
        setForgot(false);
        SnackbarHelper.showSuccessMessage(context, "Send Reset Password LINK");
        return value;
      });
    } on FirebaseAuthException catch (firebaseError) {
      setForgot(false);
      SnackbarHelper.showErrorMessage(
          context, firebaseError.message.toString());
    } catch (error) {
      setForgot(false);
      SnackbarHelper.showErrorMessage(context, error.toString());
    }
  }

  bool _isLogOut = false;
  bool get isLogOut => _isLogOut;

  setLogOut(bool value) {
    _isLogOut = value;
  }

  logOut(BuildContext context) {
    try {
      setLogOut(true);
      _firebaseAuth.signOut().then((value) {
        setLogOut(false);
        SnackbarHelper.showSuccessMessage(context, "Log out successful");
        Navigator.of(context).pushNamed(AuthScreen.routeName);
        return value;
      });
    } on FirebaseAuthException catch (firebaseError) {
      setLogOut(false);
      SnackbarHelper.showErrorMessage(
          context, firebaseError.message.toString());
    } catch (error) {
      setLogOut(false);
      SnackbarHelper.showErrorMessage(context, error.toString());
    }
  }
}
