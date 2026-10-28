/*Day 1: 
Pagi : Membuat main.dart dan profile_page.dart 
dengan Scaffold, AppBar, CircleAvatar, dan Text.
Siang : Memecah Column dengan membuat Custom Widget ProfileAvatar dan ProfileInfo.
 */

import 'package:assignment_flutter_5/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Section",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User Profile"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(child: ProfileInfo()),
      ),
    );
  }
}
