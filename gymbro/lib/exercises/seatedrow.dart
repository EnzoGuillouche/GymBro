import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class SeatedRow extends StatefulWidget {
  const SeatedRow({super.key});

  @override
  State<SeatedRow> createState() => _SeatedRowState();
}

class _SeatedRowState extends State<SeatedRow> {
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
            context.go("/back");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Seated Cable Row",
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
                      PR("Seated Cable Row"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Seated Cable Row PR"),
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
          "assets/seatedrow.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The seated cable row is a compound exercise that primarily targets the muscles of the back, specifically the latissimus dorsi, rhomboids, and trapezius, while also engaging the biceps and forearms.",
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
          "- Sit on the bench of a seated cable row machine with your feet firmly placed on the foot platform. Your knees should be slightly bent."),
      list(
          "- Hold the handle (usually a V-bar or straight bar) with an overhand or neutral grip, depending on the attachment used. \nExtend your arms fully forward to grasp the handle, but keep a slight bend in your elbows."),
      list(
          "- Sit upright with your back straight, chest up, and shoulders back. Engage your core for stability."),
      list(
          "- Pull the handle towards your torso by bending your elbows and driving them straight back. Focus on squeezing your shoulder blades together as you pull."),
      list(
          "- Slowly extend your arms to return the handle to the starting position, maintaining control and keeping a slight bend in your elbows."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully return the handle to the starting position and release your grip."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Back Muscles: Primarily works the latissimus dorsi, rhomboids, and trapezius, contributing to a stronger and more defined back."),
      list(
          "Engages Biceps and Forearms: Also activates the biceps and forearms, enhancing overall upper body strength."),
      list(
          "Improves Posture: Strengthens the muscles responsible for maintaining good posture."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your back straight and avoid leaning too far forward or backward. Maintain a neutral spine throughout the exercise."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Overextending: Do not extend your arms fully to the point where your shoulders are pulled forward. Keep a slight bend in your elbows to maintain tension."),
      list(
          "Choose Appropriate Weight: Start with a weight that allows you to perform the exercise with proper form and control."),
    ],
  );
}
