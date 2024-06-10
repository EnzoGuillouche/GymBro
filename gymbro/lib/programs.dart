import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';

class ProgramsChoose extends StatefulWidget {
  const ProgramsChoose({super.key});

  @override
  State<ProgramsChoose> createState() => _ProgramsChooseState();
}

class _ProgramsChooseState extends State<ProgramsChoose> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "GymBro",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Row(
          children: [
            Dashboard(_selectedIndex),
            SingleChildScrollView(
              child: Center(
                child: Text(
                  "This is the home page.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
