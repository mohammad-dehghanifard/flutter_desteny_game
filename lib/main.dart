import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdestinygame/screens/story_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade200,
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destiny Game',
      home: StoryScreen(),
    );
  }
}

