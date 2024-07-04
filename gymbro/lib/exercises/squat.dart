import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class Squats extends StatefulWidget {
  const Squats({super.key});

  @override
  State<Squats> createState() => _SquatsState();
}

class _SquatsState extends State<Squats> {
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
            context.go("/legs");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Squats",
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
                      PR("Squats"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Squats PR"),
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
          "assets/squats.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     Squats are a fundamental compound exercise that primarily targets the muscles of the lower body, including the quadriceps, hamstrings, glutes, and calves, while also engaging the core and lower back for stability.",
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
          "- Stand with your feet shoulder-width apart. Your toes should be slightly pointed outward."),
      list(
          "- If using a barbell, place it on your upper back, resting on your trapezius muscles. Grip the bar with your hands slightly wider than shoulder-width apart. \nIf using bodyweight or dumbbells, position your hands accordingly."),
      list(
          "- Initiate the movement by bending at your hips and knees, lowering your body as if sitting back into a chair. Ensure your knees track over your toes and do not cave inward. \nYour thighs should be at least parallel to the ground, or lower if flexibility and strength allow."),
      list(
          "- Push through your heels and extend your hips and knees to return to the starting position. \nKeep your chest up and maintain a neutral spine throughout the ascent."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, if using a barbell, carefully rack the bar back onto the squat rack."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Lower Body Muscles: Primarily works the quadriceps, hamstrings, glutes, and calves."),
      list(
          "Functional Strength: Improves overall functional strength and enhances performance in daily activities and sports."),
      list(
          "Hormonal Benefits: Stimulates the release of growth hormone and testosterone, aiding in muscle growth and fat loss."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Maintain a neutral spine and avoid rounding your back to prevent injury. Keep your chest up and shoulders back throughout the lift."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner, especially during the descending phase, to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Knee Alignment: Ensure your knees track over your toes and do not cave inward during the squat."),
      list(
          "Depth: Squat to a depth that allows you to maintain proper form. Going below parallel can be beneficial if you have the flexibility and strength to do so safely."),
    ],
  );
}
