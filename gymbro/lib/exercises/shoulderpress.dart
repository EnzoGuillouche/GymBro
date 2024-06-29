import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class ShoulderPress extends StatefulWidget {
  const ShoulderPress({super.key});

  @override
  State<ShoulderPress> createState() => _ShoulderPressState();
}

class _ShoulderPressState extends State<ShoulderPress> {
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
            context.go("/shoulders");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Shoulder Press",
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
                      PR("Shoulder Press Dumbbell "),
                      PR("Shoulder Press Machine "),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Shoulder Press Dumbbell PR"),
                      PR("Shoulder Press Machine PR"),
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
          "assets/shoulderpressD.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The shoulder press, also known as the overhead press, is a compound exercise that primarily targets the shoulder muscles (deltoids) but also engages the triceps and upper chest.\n\n     It can be performed using a barbell, dumbbells, or a machine.",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          "assets/shoulderpressM.png",
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
          "- Stand with your feet shoulder-width apart or sit on a bench with back support. Hold a barbell at shoulder height with an overhand grip, or hold a dumbbell in each hand with your palms facing forward."),
      list(
          "- Position the weight at shoulder height, with your elbows pointing slightly forward and your core engaged."),
      list(
          "- Push the weight upward until your arms are fully extended above your head. Keep your head neutral and avoid leaning back excessively."),
      list(
          "- At the top of the movement, pause briefly and squeeze your shoulder muscles."),
      list(
          "- Slowly lower the weight back to the starting position at shoulder height, maintaining control throughout the movement."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully lower the weight to the rack (if using a barbell) or place the dumbbells on your thighs before setting them down."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Shoulders: Primarily works the deltoid muscles, with a focus on the anterior (front) deltoids."),
      list(
          "Engages Upper Body Muscles: Also activates the triceps, upper chest, and traps."),
      list(
          "Builds Upper Body Strength: Essential for developing overall upper body strength and stability."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your core engaged and your back straight to avoid excessive arching of the lower back."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Locking Elbows: Keep a slight bend in your elbows at the top of the movement to maintain tension on the muscles and protect your joints."),
    ],
  );
}
