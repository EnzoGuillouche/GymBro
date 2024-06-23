import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';

class PecsProgram extends StatefulWidget {
  const PecsProgram({super.key});

  @override
  State<PecsProgram> createState() => _PecsProgramState();
}

class _PecsProgramState extends State<PecsProgram> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Pecs  -  Exercises",
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
                    exerciseContainer(context, "Bench Press", "/benchpress"),
                    exerciseContainer(context, "Inclined Bench Press", "/inclinedpress"),
                    exerciseContainer(context, "Pec Fly", "/pecfly"),
                    exerciseContainer(context, "Lower Pec Fly", "/lowerpecfly"),
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
