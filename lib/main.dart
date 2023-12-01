import 'package:dummy_application/view/santa_children.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Santa App',
      // Theme data to place the centralised theme for the app at once!
      theme: ThemeData(
          // Google fonts package for better font style
          textTheme: GoogleFonts.openSansTextTheme(),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              sizeConstraints: BoxConstraints(minHeight: 80, minWidth: 80),
              backgroundColor: Colors.black,
              splashColor: Colors.white)),
      //  Home Screen of the app
      home: const SantasList(),
    );
  }
}
