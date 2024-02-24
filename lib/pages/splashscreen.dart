import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_project/pages/login.dart';
import '../provider/authProvider.dart';
import 'homeScreen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthProvider ap;

  @override
  void initState() {
    super.initState();
    // Fetching the Provider instance in initState
    final ap = Provider.of<AuthProvider>(context, listen: false);
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() {
    Timer(const Duration(seconds: 2), () async {
      if (ap.isSignedIn == true) {
        await ap.getDataFromSP().whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'HELP...',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
