import 'package:GymBro/preferences.dart';
import 'package:flutter/material.dart';

class Prlist extends StatefulWidget {
  const Prlist({super.key});

  @override
  State<Prlist> createState() => _PrlistState();
}

class _PrlistState extends State<Prlist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 40,
        top: 25,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "PRs",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PR("Bench Bar PR"),
          PR("Deadlift PR"),
          PR("Dips PR"),
        ],
      ),
    );
  }
}
