import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooglSignInController with ChangeNotifier {
  // object

  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  // function for login
  Future<void> login() async {
    googleSignInAccount = await _googleSignIn.signIn();

    // call
    notifyListeners();
  }

  // funtion for logout
  Future<void> logout() async {
    // empty the value after logout
    googleSignInAccount = await _googleSignIn.signOut();
    // call
    notifyListeners();
  }
}
