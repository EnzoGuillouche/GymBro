import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';

class BicepsProgram extends StatefulWidget {
  const BicepsProgram({super.key});

  @override
  State<BicepsProgram> createState() => _BicepsProgramState();
}

class _BicepsProgramState extends State<BicepsProgram> {
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Biceps  -  Exercises",
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
                    exerciseContainer(context, "Incline Curl", "/inclinecurl"),
                    exerciseContainer(
                        context, "Hammer Curl", "/hammercurl"),
                    exerciseContainer(context, "Spider Curl", "/spidercurl"),
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
