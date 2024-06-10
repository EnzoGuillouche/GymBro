import 'package:GymBro/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TricepsProgram extends StatefulWidget {
  const TricepsProgram({super.key});

  @override
  State<TricepsProgram> createState() => _TricepsProgramState();
}

class _TricepsProgramState extends State<TricepsProgram> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Triceps  -  Exercises",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: Row(
          children: [
            Dashboard(selectedIndex),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    exerciseContainer(context, "Dips", "/dips"),
                    exerciseContainer(
                        context, "Skull Crushers", "/skullcrusher"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget exerciseContainer(BuildContext context, String exercise, String path) {
  return Padding(
    padding: const EdgeInsets.all(30),
    child: Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          context.go(path);
        },
        child: Container(
          width: 250,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    exercise,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
