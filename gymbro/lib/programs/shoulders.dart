import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShouldersProgram extends StatefulWidget {
  const ShouldersProgram({super.key});

  @override
  State<ShouldersProgram> createState() => _ShouldersProgramState();
}

class _ShouldersProgramState extends State<ShouldersProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.go("/");
          },
          child: Text("Shoulders"),
        ),
      ),
    );
  }
}
