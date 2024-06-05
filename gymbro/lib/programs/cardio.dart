import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardioProgram extends StatefulWidget {
  const CardioProgram({super.key});

  @override
  State<CardioProgram> createState() => _CardioProgramState();
}

class _CardioProgramState extends State<CardioProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.go("/");
          },
          child: Text("Cardio"),
        ),
      ),
    );
  }
}
