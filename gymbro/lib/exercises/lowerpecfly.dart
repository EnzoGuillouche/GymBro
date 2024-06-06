import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class LowerPecFly extends StatefulWidget {
  const LowerPecFly({super.key});

  @override
  State<LowerPecFly> createState() => _LowerPecFlyState();
}

class _LowerPecFlyState extends State<LowerPecFly> {
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
          "Lower Pec Fly",
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
                      PR("LowerFlyPulley"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("LowerFlyPulleyPR"),
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
          "assets/lowerpecfly.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The lower pec fly, performed using a cable machine (pulleys), specifically targets the lower portion of the pectoral muscles. This exercise helps enhance the lower chest definition and strength. ",
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
          "- Set the pulleys to the highest position on a cable crossover machine."),
      list(
          "- Stand in the center of the machine with a staggered stance (one foot slightly forward for balance). Hold a handle in each hand, with your arms extended out to the sides and slightly above shoulder level."),
      list(
          "- Lean slightly forward from the hips, keeping your back straight and your core engaged. Your arms should be extended out to the sides with a slight bend in the elbows, palms facing down."),
      list(
          "- Slowly bring your hands downward and together in a wide arc motion, squeezing your chest muscles as you bring the handles together at the level of your hips or lower abdomen. \n  At the bottom of the movement, pause briefly and squeeze your chest muscles to maximize contraction."),
      list(
          "- Slowly return your arms to the starting position by reversing the arc motion, keeping the movement controlled."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully step back and return the handles to the starting position."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Lower Chest: Specifically engages the lower portion of the pectoralis major."),
      list(
          "Enhances Muscle Definition: Helps improve the shape and definition of the lower chest."),
      list(
          "Isolates Chest Muscles: Focuses on the pectoral muscles without significant involvement of the triceps."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Maintain a slight bend in your elbows throughout the exercise to protect your joints."),
      list(
          "Controlled Movement: Avoid using heavy weights that you cannot control throughout the range of motion."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Overstretching: Do not bring the handles too far back to prevent shoulder injuries."),
      list(
          "Core Stability: Keep your core engaged to maintain balance and proper posture."),
    ],
  );
}
