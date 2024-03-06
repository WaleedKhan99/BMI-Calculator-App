import 'package:bmi/home.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds and then navigate to the home screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 104, 173, 253),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            Image(
              image: AssetImage('assets/bmi-logo.png'),
              width: 200,
              height: 200,
            ),
            Text(
              'BMI Calculator',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 44.0,
                  color: Colors.white),
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
