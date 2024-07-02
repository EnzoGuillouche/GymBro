import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class HammerCurl extends StatefulWidget {
  const HammerCurl({super.key});

  @override
  State<HammerCurl> createState() => _HammerCurlState();
}

class _HammerCurlState extends State<HammerCurl> {
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
            context.go("/biceps");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Hammer Curl",
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
                      PR("Hammer Curl"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Hammer Curl PR"),
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
          "assets/hammercurl.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The hammer curl is an isolation exercise that targets the biceps as well as the brachialis and brachioradialis muscles in the forearms.",
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
          "- Stand upright with your feet shoulder-width apart, holding a dumbbell in each hand with a neutral grip (palms facing each other)."),
      list(
          "- Keep your arms fully extended by your sides with a slight bend in your elbows."),
      list(
          "- Keep your upper arms stationary and your elbows close to your torso."),
      list(
          "- Curl the dumbbells upward by bending your elbows, bringing the weights toward your shoulders while maintaining the neutral grip. \nFocus on contracting your biceps and forearm muscles throughout the movement."),
      list(
          "- Slowly lower the dumbbells back to the starting position, fully extending your arms but keeping a slight bend at the elbows to maintain tension on the muscles."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully lower the dumbbells to your sides and maintain good posture."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Biceps and Forearms: Engages the biceps brachii, brachialis, and brachioradialis muscles, promoting balanced arm development."),
      list(
          "Improves Grip Strength: Strengthens the forearms and grip, beneficial for various lifting and functional activities."),
      list(
          "Enhanced Arm Strength: Effective for building size and strength in the biceps and forearms."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your elbows stationary and close to your torso throughout the exercise to ensure the muscles are doing the work."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure a proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Swinging: Do not use momentum or swing your body to lift the weights. Focus on using your biceps and forearms to perform the movement."),
      list(
          "Choose Appropriate Weight: Start with a weight that allows you to perform the exercise with proper form and control."),
    ],
  );
}
