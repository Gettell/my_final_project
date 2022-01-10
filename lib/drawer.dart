import 'package:flutter/material.dart';
import 'package:my_final_project/main_screen.dart';
import 'about_app.dart';

Widget navDrawer (context)=> Drawer(
  child: ListView(
    children: [
      DrawerHeader(
        decoration: const BoxDecoration(color: Color(0xFF03203e)),
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100.00,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Image(image: AssetImage('assets/ninja.png'),
                ),
              ),
              const Text('Навигация', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold ,color: Color(0xFFFDFBFE)),),
            ],
          ),
        ),),
      ListTile(
        leading: const Icon(Icons.import_contacts),
        title: const Text ('О приложении'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutApp ()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text ('На главную'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainScreen ()),
          );
        },
      )
    ],
  ),
);