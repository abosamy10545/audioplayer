import 'package:flutter/material.dart';
import 'package:task_audioplayer/screens/home_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 34, 25, 74), // لون غامق
              Color.fromARGB(255, 20, 20, 20), // لون فاتح
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 120,
              backgroundColor: const Color.fromARGB(255, 15, 15, 52),
              child: CircleAvatar(
                radius: 110,
                backgroundImage: AssetImage('assets/images/splash_image.png'),
              ),
            ),
            const SizedBox(height: 40),
            CircularProgressIndicator(
              color: Color.fromARGB(255, 31, 31, 156),
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}
