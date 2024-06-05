import 'package:flutter/material.dart';
import 'dart:async';

// ignore: must_be_immutable
class Timer extends StatefulWidget {
  Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.amber, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(150))),
          child: Center(
            child: Text(
              "Timer",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
