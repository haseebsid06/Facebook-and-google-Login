import 'package:fbandggl/model/userdetail.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController with ChangeNotifier {
  //object
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  Userdetails? userdetails;

  // function for google Login

  googlelogin() async {
    googleSignInAccount = await _googleSignIn.signIn();

    // Inserting values to our user details model

    userdetails = Userdetails(
      displayName: googleSignInAccount!.displayName,
      email: googleSignInAccount!.email,
      photourl: googleSignInAccount!.photoUrl,
    );

    // call

    notifyListeners();
  }

  // function for facebook login

  facebooklogin() async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email", "address"],
    );
    // chek the status of login
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture, address",
      );
      userdetails = Userdetails(
        displayName: requestData["name"],
        email: requestData["email"],
        photourl: requestData["picture"]["data"]["url"] ?? "",
      );
      notifyListeners();
    }
  }

  // logout button

  logout() async {
    googleSignInAccount = await _googleSignIn.signOut();
    await FacebookAuth.i.logOut();
    userdetails = null;
    notifyListeners();
  }
}
