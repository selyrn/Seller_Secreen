import 'package:flutter/material.dart';
import 'package:seller_app/screens/login_page.dart';
import 'package:seller_app/screens/register_page.dart';
import 'package:seller_app/screens/forgot_password_page.dart';
import 'package:seller_app/screens/new_password_page.dart';
import 'package:seller_app/screens/otp_page.dart';
import 'package:seller_app/screens/profile_page.dart';
import 'package:seller_app/screens/edit_profile_page.dart';
import 'package:seller_app/screens/tambah_produk_page.dart';
import 'package:seller_app/screens/chat_list_page.dart';
import 'package:seller_app/screens/edit_produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white),
          fontFamily: 'Poppins'),
      home: ProfilePage(),
    );
  }
}
