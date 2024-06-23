import 'package:flutter/material.dart';
import 'exercise.dart';
import 'package:go_router/go_router.dart';

class BackProgram extends StatefulWidget {
  const BackProgram({super.key});

  @override
  State<BackProgram> createState() => _BackProgramState();
}

class _BackProgramState extends State<BackProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.go("/");
          },
          child: Text("Back"),
        ),
      ),
    );
  }
}
