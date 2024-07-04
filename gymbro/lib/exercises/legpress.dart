import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class LegPress extends StatefulWidget {
  const LegPress({super.key});

  @override
  State<LegPress> createState() => _LegPressState();
}

class _LegPressState extends State<LegPress> {
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
          "Leg Press",
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
                      PR("Leg Press"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("Leg Press PR"),
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
          "assets/legpress.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The leg press is a compound exercise that primarily targets the quadriceps, hamstrings, glutes, and calves. \n\n     It is performed using a leg press machine, which allows for controlled movements and the ability to lift heavier weights safely.",
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
          "- Adjust the seat and backrest of the leg press machine to a comfortable position. \nSit down and place your feet shoulder-width apart on the foot platform."),
      list(
          "- Position your feet in the middle of the platform with your toes slightly pointed outward."),
      list(
          "- Release the safety locks and slowly lower the weight by bending your knees and hips. \nLower the platform until your knees are at approximately a 90-degree angle or until your thighs are parallel to the platform. \nKeep your lower back and hips in contact with the seat."),
      list(
          "- Push through your heels and extend your knees and hips to press the weight back up to the starting position. \nDo not lock your knees at the top of the movement to keep tension on the muscles."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully engage the safety locks before removing your feet from the platform."),
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
          "Muscle Isolation: Helps to isolate and target specific muscle groups in the lower body."),
      list(
          "Leg Strength: Effective for building leg strength and muscle mass."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Keep your back and hips in contact with the seat throughout the exercise. Avoid letting your lower back lift off the seat to prevent injury."),
      list(
          "Controlled Movement: Perform the exercise in a slow and controlled manner, especially during the descending phase, to maximize muscle engagement and prevent injury."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Knee Alignment: Ensure your knees track over your toes and do not cave inward or flare outward during the movement."),
      list(
          "Depth: Lower the platform until your knees are at approximately a 90-degree angle or until your thighs are parallel to the platform. \nAvoid going too deep if it causes discomfort or you cannot maintain proper form."),
    ],
  );
}
