import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';

class TricepsProgram extends StatefulWidget {
  const TricepsProgram({super.key});

  @override
  State<TricepsProgram> createState() => _TricepsProgramState();
}

class _TricepsProgramState extends State<TricepsProgram> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Triceps  -  Exercises",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: Row(
          children: [
            Dashboard(selectedIndex),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    exerciseContainer(context, "Dips", "/dips"),
                    exerciseContainer(
                        context, "Skull Crushers", "/skullcrusher"),
                    exerciseContainer(
                        context, "Cable Triceps", "/tricepspulley"),
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