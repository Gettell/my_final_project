import 'package:flutter/material.dart';
import 'package:my_final_project/strings.dart';


class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('О приложении'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const Center(child: Text(Strings.aboutApp)),
      ),
    );
  }
}