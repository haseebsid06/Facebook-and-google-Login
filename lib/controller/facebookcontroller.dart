import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInController with ChangeNotifier {
  Map? userData;

  Future<void> login() async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email", "address"],
    );
    // chek the status of login
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture, address",
      );
      userData = requestData;

      notifyListeners();
    }
  }

  // logout function

  Future<void> logout() async {
    await FacebookAuth.i.logOut();
    userData = null;
    notifyListeners();
  }
}
