import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class SpiderCurl extends StatefulWidget {
  const SpiderCurl({super.key});

  @override
  State<SpiderCurl> createState() => _SpiderCurlState();
}

class _SpiderCurlState extends State<SpiderCurl> {
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
          "Spider Curl",
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
                      PR("Spider Curl"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Spider Curl PR"),
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
          "assets/spidercurl.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The spider curl is an isolation exercise that targets the biceps, specifically emphasizing the peak contraction and overall bicep development. \n\n     It is performed on an inclined bench, allowing for a full range of motion and intense muscle engagement.",
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
          "- Adjust an incline bench to about 45 degrees. Position yourself face down on the bench with your chest and stomach against the padding. \nYour arms should hang down straight towards the floor, holding a barbell or dumbbells with an underhand grip (palms facing up)."),
      list(
          "- Let your arms hang fully extended with a slight bend in your elbows."),
      list(
          "- Curl the barbell or dumbbells upward by bending your elbows, bringing the weights towards your shoulders. Focus on contracting your biceps throughout the movement."),
      list(
          "- At the top of the movement, pause briefly and squeeze your biceps to maximize contraction."),
      list(
          "- Slowly lower the barbell or dumbbells back to the starting position, fully extending your arms but keeping a slight bend at the elbows to maintain tension on the biceps."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully lower the weights to the ground or your thighs before standing up."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Biceps: Specifically isolates the biceps, emphasizing the short head for better peak development."),
      list(
          "Improves Arm Strength: Effective for building strength and muscle mass in the biceps."),
      list(
          "Enhanced Isolation: The incline position reduces the involvement of other muscles, ensuring the biceps are fully engaged."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your upper arms stationary and your elbows pointed straight down throughout the exercise"),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Avoid Swinging: Do not use momentum or swing your body to lift the weights. Focus on using your biceps to perform the movement."),
      list(
          "Choose Appropriate Weight: Start with a weight that allows you to perform the exercise with proper form and control."),
    ],
  );
}
