import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/detail_page.dart';
import 'about_app.dart';
import 'login_page.dart';
import 'main_screen.dart';


void main() {
  runApp(const MyFinalProject());
}

class MyFinalProject extends StatelessWidget {
  const MyFinalProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My final project',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF03203e)),
      ),
      routes: {
        '/login_page': (context) => LoginPage(),
        '/main_screen':(context) => MainScreen(),
        '/about_app': (context)=> AboutApp(),
      },
      initialRoute: '/login_page',
    );
  }
}
