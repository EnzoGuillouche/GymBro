import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PecFly extends StatefulWidget {
  const PecFly({super.key});

  @override
  State<PecFly> createState() => _PecFlyState();
}

class _PecFlyState extends State<PecFly> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: GestureDetector(
            onTap: () {
              context.go("/pecs");
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Pec Fly",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            context.go("/pecs");
          },
          child: Text("Pec Fly"),
        ),
      ),
    );
  }
}
