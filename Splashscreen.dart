import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_calc/Intropage.dart';
import 'dart:ui' as ui;
import 'package:flutter/src/scheduler/ticker.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this, // Adjust the duration as needed
    );

    // Create a fade-in animation
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation after a delay
    Timer(Duration(seconds: 1), () {
      _controller.forward();
    });


    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroPage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Text("Calculator",
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 55,
                  foreground: Paint()..shader = ui.Gradient.linear(
                const Offset(0, 0),
                const Offset(100, 180),
                <Color>[
                  Colors.purple,
                  Colors.black,
                ],
              )),

            ),),
          ),
        ),
    );
  }
}