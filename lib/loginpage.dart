import 'package:fbandggl/controller/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.deepPurple,
      ),

      // body of ui
      body: loginUI(),
    );
  }

  loginUI() {
    // Logged in ui
    //Login Conroller
    return Consumer<LoginController>(builder: (context, model, child) {
      // if we are already logged in

      if (model.userdetails != null) {
        return Center(
          child: loggedInUi(model),
        );
      } else {
        return loginControllers(context);
      }
    });
  }

  loggedInUi(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      // our ui will have 3 children name, email, photo, LogoutNutton

      children: [
        CircleAvatar(
          backgroundImage: Image.network(
            model.userdetails!.photourl ?? '',
            // width: 10,
          ).image,
          radius: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.userdetails!.displayName ?? '',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.userdetails!.email ?? '',
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<LoginController>(context, listen: false).logout();
          },
          child: SizedBox(
            height: 30,
            width: 100,
            child: Row(
              children: const [
                Icon(
                  Icons.logout,
                  color: Colors.deepPurple,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              ],
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shadowColor: MaterialStateProperty.all(Colors.deepPurple),
          ),
        ),
      ],
    );
  }

  loginControllers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Provider.of<LoginController>(context, listen: false)
                  .googlelogin();
            },
            child: SizedBox(
              height: 40,
              width: 220,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'asset/google.png',
                    fit: BoxFit.contain,
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 30,
                    width: 1,
                    color: Colors.black,
                  ),
                  const Text('Connect with Google',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shadowColor: MaterialStateProperty.all(Colors.deepPurple),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<LoginController>(context, listen: false)
                  .facebooklogin();
            },
            child: SizedBox(
              height: 40,
              width: 220,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'asset/fb.png',
                    fit: BoxFit.contain,
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 30,
                    width: 1,
                    color: Colors.black,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 30,
                    thickness: 10,
                  ),
                  const Text('Connect with Facebook',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shadowColor: MaterialStateProperty.all(Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
