import 'package:flutter/material.dart';
import 'package:GymBro/preferences.dart';
import 'package:GymBro/notif.dart';
import 'package:GymBro/routes.dart';
import 'package:GymBro/schedule.dart';
import 'package:GymBro/timer.dart';
import 'package:GymBro/prList.dart';

class ProgramsChoose extends StatefulWidget {
  const ProgramsChoose({super.key});

  @override
  State<ProgramsChoose> createState() => _ProgramsChooseState();
}

class _ProgramsChooseState extends State<ProgramsChoose> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    initializeNotifications();

    if (isPrWeek()) {
      showNotification();
    }
  }

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
                Prlist(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    top: 25,
                  ),
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
