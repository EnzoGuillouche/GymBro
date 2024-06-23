import 'package:flutter/material.dart';
import 'exercise.dart';
import 'package:go_router/go_router.dart';

class AbsProgram extends StatefulWidget {
  const AbsProgram({super.key});

  @override
  State<AbsProgram> createState() => _AbsProgramState();
}

class _AbsProgramState extends State<AbsProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.go("/");
          },
          child: Text("Abs"),
        ),
      ),
    );
  }
}
