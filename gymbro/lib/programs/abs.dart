import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';

class AbsProgram extends StatefulWidget {
  const AbsProgram({super.key});

  @override
  State<AbsProgram> createState() => _AbsProgramState();
}

class _AbsProgramState extends State<AbsProgram> {
  int _selectedIndex = 6;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Abs  -  Exercises",
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
                    exerciseContainer(context, "Hanging Leg Raises", "/legraises"),
                    exerciseContainer(
                        context, "Decline Crunches", "/declinecrunches"),
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
