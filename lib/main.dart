// ignore_for_file: prefer ructors, prefer ructors_in_immutables, non ant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_import, body_might_complete_normally_nullable, await_only_futures, use_key_in_widget_constructors, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'chat_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<bool> checkUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
  
  bool isLoggedIn = await checkUserLoggedIn();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? ChatApp() : LoginPage(),
    ),
  );
}

