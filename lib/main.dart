import 'package:flutter/material.dart';
import 'package:new_bodima_app/client_view/custom_tabBar.dart';
import 'package:new_bodima_app/login_view/home_screen.dart';
import 'package:new_bodima_app/login_view/otp_screen.dart';
import 'package:new_bodima_app/user_view/add_user_screen.dart';
import 'package:new_bodima_app/user_view/payment_screen/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddUserScreen(),
    );
  }
}
