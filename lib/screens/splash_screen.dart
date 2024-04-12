import 'package:flutter/material.dart';
import 'package:tomato_disease_detection1/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/splash1.png'),
      ),
    );
  }
}
