// ignore_for_file: prefer_const_constructors

import 'dart:math'show pi;

import 'package:flutter/material.dart';



void main() => runApp(const ScaffoldExampleApp());

class ScaffoldExampleApp extends StatelessWidget {
  const ScaffoldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: ScaffoldExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({super.key});

  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0.0, 
      end: 2 * pi,
      ).animate(_controller);

    _controller.repeat();
  }
@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  /*
 0.0=0degree
 0.5=180 degree
 1.0 = 360 degree
 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 68, 79),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              // origin:const Offset(50, 50),
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(_animation.value),
              child: Container(
                 width: 100,
                 height: 100,  
                            
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: 7,
                        spreadRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
