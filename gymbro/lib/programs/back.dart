import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';

class BackProgram extends StatefulWidget {
  const BackProgram({super.key});

  @override
  State<BackProgram> createState() => _BackProgramState();
}

class _BackProgramState extends State<BackProgram> {
  int _selectedIndex = 5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Back  -  Exercises",
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
                    exerciseContainer(context, "Pull-ups", "/pullups"),
                    exerciseContainer(context, "Seated Cable Row", "/seatedrow"),
                    exerciseContainer(
                        context, "Deadlift", "/deadlift"),
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
