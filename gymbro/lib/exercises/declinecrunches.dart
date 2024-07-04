import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class DeclineCrunches extends StatefulWidget {
  const DeclineCrunches({super.key});

  @override
  State<DeclineCrunches> createState() => _DeclineCrunchesState();
}

class _DeclineCrunchesState extends State<DeclineCrunches> {
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
            context.go("/abs");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Decline Crunches",
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
                      PR("Decline Crunches"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Decline Crunches PR"),
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
          "assets/declinecrunches.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     Decline crunches are an effective abdominal exercise that targets the rectus abdominis (the \"six-pack\" muscles) and can also engage the obliques and hip flexors.",
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
          "- Adjust a decline bench to a comfortable angle, typically between 30 to 45 degrees."),
      list(
          "- Lie on the bench with your head at the lower end and your feet secured under the foot pads. Your knees should be slightly bent."),
      list(
          "- Lift your upper body towards your knees by curling your spine and contracting your abdominal muscles. \nFocus on lifting your shoulder blades off the bench rather than pulling with your neck."),
      list(
          "- Slowly lower your upper body back to the starting position, maintaining control and keeping tension in your abs."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully sit up and step off the bench."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Abs: Specifically isolates the rectus abdominis, helping to build strength and definition in the abdominal muscles."),
      list(
          "Enhanced Muscle Engagement: The decline position increases the range of motion and intensity, leading to more effective muscle engagement."),
      list(
          "Improves Core Strength: Effective for building overall core strength and stability."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Avoid pulling on your neck with your hands. Instead, focus on lifting your shoulder blades using your abdominal muscles."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Overextending: Do not hyperextend your back at the bottom of the movement. Keep your lower back in contact with the bench."),
      list(
          "Choose Appropriate Resistance: Start without added weight to master the form, and gradually increase resistance as you build strength."),
    ],
  );
}
