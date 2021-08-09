import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_custom_animation/constants.dart';
import 'package:grocery_custom_animation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            shape: const StadiumBorder(),
            backgroundColor: primaryColor,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
