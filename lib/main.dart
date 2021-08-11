import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      
      home: HomePage(),
    );
  }
}

