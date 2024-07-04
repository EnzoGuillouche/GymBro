import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class PullUps extends StatefulWidget {
  const PullUps({super.key});

  @override
  State<PullUps> createState() => _PullUpsState();
}

class _PullUpsState extends State<PullUps> {
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
          "Pull-up",
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
                      PR("Pull-up"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Pull-up PR"),
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
          "assets/pullups.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     Pull-ups are a compound bodyweight exercise that primarily targets the muscles of the back, particularly the latissimus dorsi, but also engages the biceps, shoulders, and core.",
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
          "- Find a sturdy pull-up bar. Grip the bar with an overhand grip (palms facing away from you) and your hands slightly wider than shoulder-width apart."),
      list(
          "- Hang from the bar with your arms fully extended. Engage your core and keep your body straight, avoiding any swinging or kipping."),
      list(
          "- Pull yourself upward by bending your elbows and driving them down towards your sides. \nFocus on bringing your chest up to the bar while squeezing your shoulder blades together."),
      list(
          "- Continue pulling until your chin is above the bar. Aim to touch your upper chest to the bar if possible."),
      list(
          "- Slowly lower yourself back to the starting position by extending your arms. Maintain control throughout the descent."),
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
          "Targets Upper Body: Primarily works the latissimus dorsi, biceps, and forearms, while also engaging the shoulders, traps, and core."),
      list(
          "Builds Upper Body Strength: Effective for building strength and muscle mass in the upper body."),
      list(
          "Functional Movement: Enhances overall upper body functional strength, beneficial for various sports and daily activities."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your body straight and avoid swinging or kipping to ensure the muscles do the work."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Overgripping: Use a grip that is firm but not excessively tight to avoid unnecessary strain on the wrists and forearms."),
      list(
          "Gradual Progression: If you're unable to perform a full pull-up, use resistance bands or an assisted pull-up machine to build strength gradually."),
    ],
  );
}
