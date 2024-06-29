import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class TricepsPulley extends StatefulWidget {
  const TricepsPulley({super.key});

  @override
  State<TricepsPulley> createState() => _TricepsPulleyState();
}

class _TricepsPulleyState extends State<TricepsPulley> {
  int barIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      barIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: GestureDetector(
          onTap: () {
            context.go("/triceps");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Triceps extensions with pulley",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: barIndex == 0
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      title("Working weight"),
                      PR("Triceps Extension"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Triceps Extension PR"),
                    ],
                  ),
                  description(),
                  steps(),
                  benefits(),
                  safetyTips(),
                ],
              ),
            )
          : Timer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Chronometer',
          ),
        ],
        currentIndex: barIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    ));
  }
}

Widget description() {
  return Column(
    children: [
      title("Exercise Description"),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          "assets/tricepspulley.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     Triceps extensions with a pulley, also known as cable triceps extensions, are an effective isolation exercise that targets the triceps. \n\n     They can be performed using a rope or a bar.",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          "assets/tricepspulleyB.png",
          width: 300,
        ),
      ),
    ],
  );
}

Widget steps() {
  return Column(
    children: [
      title("Steps of Execution"),
      list(
          "-  Attach a straight bar, rope, or V-bar handle to the high pulley of a cable machine."),
      list(
          "- Stand facing the machine with your feet shoulder-width apart. Grab the handle with an overhand grip (palms facing down) and step back slightly to create tension in the cable."),
      list(
          "- Keep your elbows close to your body and your upper arms stationary. Your elbows should be bent at about 90 degrees."),
      list(
          "- Extend your arms straight down by straightening your elbows, pushing the handle downward until your arms are fully extended. Focus on contracting your triceps during this phase."),
      list(
          "- Slowly return the handle to the starting position by bending your elbows, keeping the movement controlled."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully release the handle back to the starting position."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Triceps: Isolates the triceps brachii, specifically focusing on the lateral and medial heads."),
      list(
          "Builds Arm Strength: Effective for building size and strength in the triceps."),
      list(
          "Cable Tension: Provides continuous tension on the muscles throughout the movement."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your elbows close to your body and your upper arms stationary throughout the exercise to ensure the triceps do the work."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Swinging: Do not use momentum or swing your body to move the weight. Focus on using your triceps to perform the movement."),
      list(
          "Adjust Weight: Choose an appropriate weight that allows you to perform the exercise with proper form and control."),
    ],
  );
}
