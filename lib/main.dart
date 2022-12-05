import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Nunito",
        backgroundColor: const Color(0xFFf6f6f6),
        scaffoldBackgroundColor: const Color(0xFFf6f6f6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFf6f6f6),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF979797),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
