import 'package:fbandggl/controller/logincontroller.dart';
import 'package:fbandggl/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: const LoginPage(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
