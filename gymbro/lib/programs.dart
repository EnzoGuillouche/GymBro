import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgramsChoose extends StatefulWidget {
  const ProgramsChoose({super.key});

  @override
  State<ProgramsChoose> createState() => _ProgramsChooseState();
}

class _ProgramsChooseState extends State<ProgramsChoose> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GymBro"),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                programContainer(context, "pecs"),
                programContainer(context, "biceps"),
                programContainer(context, "triceps"),
                programContainer(context, "back"),
                programContainer(context, "shoulders"),
                programContainer(context, "cardio"),
                programContainer(context, "abs"),
                programContainer(context, "legs"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget programContainer(BuildContext context, String program) {
  return Padding(
    padding: const EdgeInsets.all(50),
    child: Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          debugPrint(program);
          context.go("/$program");
        },
        child: Container(
          width: 100,
          height: 75,
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
          child: Center(
            child: Text(
              program,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
