import 'package:byte_banck/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() =>
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ByteBanck',
    theme: ThemeData(
      primaryColor: Colors.green[900],
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.blueAccent[700],
      ),
      buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent[700],
      textTheme: ButtonTextTheme.primary,
    ),    
  ),
  home: const HomeScreen(),
  ));