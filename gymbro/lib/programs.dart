import 'package:GymBro/routes.dart';
import 'package:GymBro/schedule.dart';
import 'package:GymBro/timer.dart';
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
    return Scaffold(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Dashboard(_selectedIndex),
          SingleChildScrollView(
            child: Column(
              children: [
                Schedule(),
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 10,),
                  child: Timer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
