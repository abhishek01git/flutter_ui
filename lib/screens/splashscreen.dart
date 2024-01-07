import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teachersapp/screens/login.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    _StartTimer();
  }

  _StartTimer() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyLoginScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Lottie.network(
              'https://lottie.host/1b87c011-b533-42a7-bf87-a5a3dbf02cff/F6IxOOzcAj.json'),
        ),
      ),
    );
  }
}
