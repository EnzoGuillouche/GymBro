import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes.dart';

class PecsProgram extends StatefulWidget {
  const PecsProgram({super.key});

  @override
  State<PecsProgram> createState() => _PecsProgramState();
}

class _PecsProgramState extends State<PecsProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            context.go("/");
          },
          child: Text("Pecs"),
        ),
      ),
    );
  }
}
