import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';

import 'package:flutter_application_1/modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/themeProvider.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme:
      // ThemeData(
      //   bottomSheetTheme: const BottomSheetThemeData(
      //     backgroundColor: Colors.transparent,
      //   ),
      //   fontFamily: "Nunito",
      //   scaffoldBackgroundColor: const Color(0xFFf6f6f6),
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Color(0xFFf6f6f6),
      //     elevation: 0,
      //     titleTextStyle: TextStyle(
      //       color: Color(0xFF979797),
      //     ),
      //   ),
      // ),
      // home: const HomePage(),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isUser = false;
  @override
  initState() {
    super.initState();
    getStringValuesSF() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      String? stringValue = prefs.getString('userId');
      if (stringValue != null) {
        setState(() {
          isUser = true;
        });
      }
    }

    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    return isUser ? const HomePage() : const Modal();
  }
}
