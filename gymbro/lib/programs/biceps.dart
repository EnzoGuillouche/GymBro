import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes.dart';

class BicepsProgram extends StatefulWidget {
  const BicepsProgram({super.key});

  @override
  State<BicepsProgram> createState() => _BicepsProgramState();
}

class _BicepsProgramState extends State<BicepsProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.go("/");
          },
          child: Text("Biceps"),
        ),
      ),
    );
  }
}
