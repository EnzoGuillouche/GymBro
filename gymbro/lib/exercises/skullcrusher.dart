import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class SkullCrusher extends StatefulWidget {
  const SkullCrusher({super.key});

  @override
  State<SkullCrusher> createState() => _SkullCrusherState();
}

class _SkullCrusherState extends State<SkullCrusher> {
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
          "Skull Crushers",
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
                      PR("SkullCrushers"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("SkullCrushersPR"),
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

Widget title(String title) {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget list(String list) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      list,
      style: const TextStyle(
        fontSize: 18,
      ),
    ),
  );
}

Widget description() {
  return Column(
    children: [
      title("Exercise Description"),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          "assets/skullcrusher.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     Skull crushers, also known as lying triceps extensions, are an isolation exercise that specifically targets the triceps.\n\n     They can be performed sited or lied down on a bench, using dumbbells or an EZ curl bar.",
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
          "- Lie flat on a bench with your feet firmly planted on the ground. Hold an EZ curl bar, barbell, or dumbbells with an overhand grip (palms facing forward) and extend your arms straight up towards the ceiling."),
      list(
          "- Your hands should be shoulder-width apart or slightly narrower."),
      list(
          "- Keeping your upper arms stationary and elbows pointing forward, slowly lower the weight towards your forehead (or just above your head). Bend your elbows to bring the bar or dumbbells down."),
      list(
          "- Lower the weight until your forearms are just past parallel to the floor or you feel a stretch in your triceps."),
      list(
          "- Push the weight back up to the starting position by straightening your arms. Exhale as you extend your elbows."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully lower the bar or dumbbells to your thighs and then sit up to place them on the ground."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Triceps: Isolates the triceps brachii, specifically the long head."),
      list(
          "Builds Arm Strength: Effective for building size and strength in the triceps."),
      list(
          "Complements Other Presses: Enhances performance in compound pressing movements like the bench press."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your upper arms stationary throughout the exercise to ensure the triceps do the work. Avoid flaring your elbows out to the sides."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Overextension: Do not let the weight go too far back, which can place excessive strain on the elbows and shoulders."),
      list(
          "Spotter: Consider having a spotter, especially when using heavier weights, to assist if you struggle to lift the bar back up."),
    ],
  );
}
