import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class DeadLift extends StatefulWidget {
  const DeadLift({super.key});

  @override
  State<DeadLift> createState() => _DeadLiftState();
}

class _DeadLiftState extends State<DeadLift> {
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
          "Deadlift",
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
                      PR("Deadlift"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Deadlift PR"),
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
          "assets/deadlift.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The deadlift is a compound exercise that targets multiple muscle groups, primarily the lower back, glutes, hamstrings, and quads, while also engaging the upper back, traps, and forearms. \n\n     It is one of the fundamental lifts for building overall strength and muscle mass.",
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
          "- Stand with your feet shoulder-width apart with a barbell loaded in front of you on the floor."),
      list(
          "- Bend at your hips and knees to lower your body and grasp the bar with an overhand grip (palms facing you), or use a mixed grip (one palm facing you and one facing away) for heavier weights. Your hands should be just outside your knees."),
      list(
          "- Position the bar over the middle of your feet. Keep your chest up, back straight, and shoulders slightly in front of the bar. Engage your core and look straight ahead or slightly up."),
      list(
          "- Push through your heels and extend your hips and knees to lift the bar. Keep the bar close to your body, maintaining a straight back and engaged core throughout the movement."),
      list(
          "- Lower the bar by hinging at the hips first, then bending your knees once the bar passes your knees. Keep the bar close to your body and maintain control throughout the descent."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully lower the bar to the floor with control."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Full-Body Engagement: Targets multiple muscle groups, including the lower back, glutes, hamstrings, quads, traps, and forearms."),
      list(
          "Builds Strength and Mass: Effective for building overall strength, muscle mass, and power."),
      list(
          "Improves Functional Strength: Enhances performance in everyday activities and other lifts by improving core stability and strength."),
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
          "Controlled Movement: Perform the exercise in a slow and controlled manner, especially when lowering the bar, to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Overextending: Do not lean back at the top of the lift. Stand straight and engage your core."),
      list(
          "Choose Appropriate Weight: Start with a weight that allows you to perform the exercise with proper form and control. Gradually increase the weight as you build strength and confidence."),
    ],
  );
}
