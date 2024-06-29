import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class RearDelt extends StatefulWidget {
  const RearDelt({super.key});

  @override
  State<RearDelt> createState() => _RearDeltState();
}

class _RearDeltState extends State<RearDelt> {
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
          "Rear Delt",
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
                      PR("Rear Delt Cable"),
                      PR("Rear Delt Machine"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Rear Delt Cable PR"),
                      PR("Rear Delt Machine PR"),
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
          "assets/reardeltC.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The rear delt fly, also known as the reverse fly or reverse pec deck, is an isolation exercise that specifically targets the posterior deltoids (rear delts). \n\n     It can be performed using dumbbells, cables, or a machine.",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          "assets/reardeltM.png",
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
          "- Lean forward at the hips, keeping your back straight and your chest up. Your torso should be nearly parallel to the floor."),
      list(
          "- Keep a slight bend in your elbows and engage your core for stability."),
      list(
          "- Raise your arms out to the sides in a wide arc motion until they are level with your shoulders. Focus on squeezing your shoulder blades together at the top of the movement."),
      list(
          "- At the top of the movement, pause briefly and squeeze your rear deltoids."),
      list(
          "- Slowly lower the weight back to the starting position, maintaining control throughout the movement."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully lower the dumbbells to the ground or rack them if using a machine."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Rear Delts: Specifically isolates the posterior deltoids, helping to improve shoulder balance and posture."),
      list(
          "Engages Upper Back Muscles: Also activates the rhomboids, traps, and other upper back muscles."),
      list(
          "Enhances Shoulder Health: Helps prevent shoulder injuries by strengthening often neglected muscles."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Maintain a slight bend in your elbows throughout the exercise to protect your joints. Avoid swinging or using momentum."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Overarching: Keep your back straight and avoid arching your lower back to maintain proper form."),
    ],
  );
}
