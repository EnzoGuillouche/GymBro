import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';

class LegsProgram extends StatefulWidget {
  const LegsProgram({super.key});

  @override
  State<LegsProgram> createState() => _LegsProgramState();
}

class _LegsProgramState extends State<LegsProgram> {
  int _selectedIndex = 7;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Legs  -  Exercises",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: Row(
          children: [
            Dashboard(_selectedIndex),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    exerciseContainer(
                        context, "Squats", "/squats"),
                    exerciseContainer(context, "Leg Press", "/legpress"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
