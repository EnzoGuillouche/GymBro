import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class InclinedPress extends StatefulWidget {
  const InclinedPress({super.key});

  @override
  State<InclinedPress> createState() => _InclinedPressState();
}

class _InclinedPressState extends State<InclinedPress> {
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
            context.go("/pecs");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Inclined Bench Press",
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
                      PR("Inclined Bar"),
                      PR("Inclined Dumbbell"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Inclined Bar PR"),
                      PR("Inclined Dumbbell PR"),
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
          "assets/inclinedpressB.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The inclined bench press is a variation of the traditional bench press that primarily targets the upper portion of the chest (upper pectoralis major) and the shoulders.\n\n     It is performed using a barbell or dumbbells while lying on a bench.",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          "assets/inclinedpressD.png",
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
          "- Adjust an adjustable bench to an incline angle, typically between 30 to 45 degrees. \n   Lie back on the inclined bench with your feet flat on the ground, maintaining a stable position."),
      list(
          "- Grip the barbell or dumbbells with hands slightly wider than shoulder-width apart. Ensure an even and firm grip."),
      list(
          "- Lift the barbell off the rack with your arms fully extended, positioning it directly above your upper chest if using a barbell."),
      list(
          "- Slowly lower the barbell or dumbbells to your upper chest by bending your elbows. The bar or dumbbells should touch your upper chest just below the collarbone."),
      list(
          "- Push the weight back up to the starting position by extending your arms. Exhale as you press the weight up, and keep the movement controlled."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully guide the barbell back to the rack or place the dumbbells back on the ground in a controlled manner."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Upper Chest: Focuses on the upper portion of the pectoralis major."),
      list(
          "Engages Shoulders: Activates the anterior deltoids more than the flat bench press."),
      list(
          "Improves Upper Body Strength: Essential for balanced chest development and upper body strength."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Use a Spotter: Especially when lifting heavy weights, to assist if you struggle to lift the bar."),
      list(
          "Proper Form: Maintain proper form to avoid shoulder and lower back injuries."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Bench Angle: Keep the bench angle moderate (30-45 degrees) to avoid excessive strain on the shoulders."),
    ],
  );
}
