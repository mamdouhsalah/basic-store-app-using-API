import 'package:api_app/features/home/model/datalaptob.dart';
import 'package:api_app/features/home/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  getData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
