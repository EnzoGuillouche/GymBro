import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TricepsProgram extends StatefulWidget {
  const TricepsProgram({super.key});

  @override
  State<TricepsProgram> createState() => _TricepsProgramState();
}

class _TricepsProgramState extends State<TricepsProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.go("/");
          },
          child: Text("Triceps"),
        ),
      ),
    );
  }
}
