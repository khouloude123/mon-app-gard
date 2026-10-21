import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(const MaGarderieApp());

class MaGarderieApp extends StatelessWidget {
  const MaGarderieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Garderie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F9FF),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Transition automatique après 3 secondes
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // L'image d'accueil
            Image.asset('assets/images/garderie.jpg', height: 250),
            const SizedBox(height: 20),
            const Text(
              'Ma Garderie',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A9BD5),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Bienvenue',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
