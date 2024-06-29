import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';

class ShouldersProgram extends StatefulWidget {
  const ShouldersProgram({super.key});

  @override
  State<ShouldersProgram> createState() => _ShouldersProgramState();
}

class _ShouldersProgramState extends State<ShouldersProgram> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Shoulders  -  Exercises",
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
                        context, "Shoulder Press", "/shoulderpress"),
                    exerciseContainer(
                        context, "Rear Delt", "/reardelt"),
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
