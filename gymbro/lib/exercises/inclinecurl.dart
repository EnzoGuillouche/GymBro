import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class InclineCurl extends StatefulWidget {
  const InclineCurl({super.key});

  @override
  State<InclineCurl> createState() => _InclineCurlState();
}

class _InclineCurlState extends State<InclineCurl> {
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
            context.go("/biceps");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Incline Curl",
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
                      PR("Incline Curl"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Incline Curl PR"),
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
          "assets/inclinecurl.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The incline curl is an isolation exercise that targets the biceps, particularly the long head, which helps in building peak and overall size.",
          style: TextStyle(fontSize: 18),
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
          "-  Adjust an incline bench to an angle of about 45 degrees."),
      list(
          "- Hold a dumbbell in each hand with an underhand grip (palms facing forward) and let your arms hang straight down towards the floor."),
      list(
          "-  Slowly curl the dumbbells upward by bending your elbows, bringing the weights towards your shoulders. Focus on contracting your biceps throughout the movement."),
      list(
          "- At the top of the movement, pause briefly and squeeze your biceps to maximize contraction."),
      list(
          "- Slowly lower the dumbbells back to the starting position, fully extending your arms but keeping a slight bend at the elbows to maintain tension on the biceps."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully lower the dumbbells to the ground or your thighs before standing up."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Biceps: Specifically isolates the long head of the biceps, contributing to overall size and peak development."),
      list(
          "Improves Arm Strength: Effective for building strength and muscle mass in the biceps."),
      list(
          "Enhanced Range of Motion: The inclined position allows for a greater range of motion, leading to more effective muscle engagement."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your elbows stationary and close to your body throughout the exercise to ensure the biceps are doing the work."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Swinging: Do not use momentum or swing your body to lift the weights. Focus on using your biceps to perform the movement."),
      list(
          "Choose Appropriate Weight: Start with a weight that allows you to perform the exercise with proper form and control."),
    ],
  );
}
