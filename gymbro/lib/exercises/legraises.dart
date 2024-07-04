import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class LegRaises extends StatefulWidget {
  const LegRaises({super.key});

  @override
  State<LegRaises> createState() => _LegRaisesState();
}

class _LegRaisesState extends State<LegRaises> {
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
          "Hanging Leg Raises",
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
                      PR("Leg Raises"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Leg Raises PR"),
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
          "assets/legraises.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     Hanging leg raises are an effective core exercise that primarily targets the lower abdominal muscles but also engages the hip flexors and other muscles of the core.",
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
          "- Find a sturdy pull-up bar and grasp it with an overhand grip (palms facing away from you), shoulder-width apart."),
      list(
          "- Hang from the bar with your arms fully extended and your legs straight. Engage your core and keep your body stable."),
      list(
          "- Raise your legs by contracting your abdominal muscles, lifting them until they are parallel to the ground or as high as you can comfortably go. \nKeep your legs straight or slightly bent, depending on your flexibility and strength."),
      list(
          "- Slowly lower your legs back to the starting position, maintaining control and avoiding any swinging."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully drop down from the bar or lower yourself with control."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Lower Abs: Specifically isolates the lower abdominal muscles, helping to improve core strength and definition."),
      list(
          "Engages Hip Flexors: Also activates the hip flexors, contributing to overall core and hip strength."),
      list(
          "Improves Stability: Enhances overall core stability and functional strength."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your body stable and avoid swinging or using momentum to lift your legs. Focus on using your abdominal muscles to perform the movement."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Grip Strength: Ensure you have a strong grip on the bar to maintain stability and prevent slipping."),
      list(
          "Avoid Overarching: Keep your back straight and avoid overarching your lower back to maintain proper form."),
    ],
  );
}
