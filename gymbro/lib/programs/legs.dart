import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes.dart';

class LegsProgram extends StatefulWidget {
  const LegsProgram({super.key});

  @override
  State<LegsProgram> createState() => _LegsProgramState();
}

class _LegsProgramState extends State<LegsProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.go("/");
          },
          child: Text("Legs"),
        ),
      ),
    );
  }
}
