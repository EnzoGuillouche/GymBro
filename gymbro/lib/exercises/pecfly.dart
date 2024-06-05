import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class PecFly extends StatefulWidget {
  const PecFly({super.key});

  @override
  State<PecFly> createState() => _PecFlyState();
}

class _PecFlyState extends State<PecFly> {
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
          "Pec Fly",
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
                      PR("ButterflyPulley"),
                      PR("ButterflyMachine"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("ButterflyPulleyPR"),
                      PR("ButterflyMachinePR"),
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
          "assets/pecflyP.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The pec fly, or chest fly, is an isolation exercise that targets the pectoral muscles, primarily the pectoralis major. \n\n     It is typically performed using a machine or with a cable machine.",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          "assets/pecflyM.png",
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
          "- Lie flat on a bench with your feet firmly planted on the ground."),
      list(
          "- Hold a dumbbell in each hand with your arms extended above your chest, palms facing each other. Keep a slight bend in your elbows to reduce strain on the joints."),
      list(
          "- Slowly lower your arms out to the sides in a wide arc, keeping the slight bend in your elbows. Lower the weights until your arms are parallel to the floor or you feel a stretch in your chest."),
      list(
          "- At the bottom of the movement, your palms should be facing up and your chest fully stretched."),
      list(
          "- Bring the dumbbells back together by squeezing your chest muscles, reversing the arc motion. Keep the movement controlled and avoid locking your elbows at the top."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- After completing your set, carefully lower the dumbbells to your thighs and then sit up to place them on the ground."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Isolates Chest Muscles: Focuses on the pectoralis major without significant involvement of the triceps."),
      list(
          "Enhances Muscle Definition: Helps improve the definition and shape of the chest."),
      list(
          "Improves Flexibility: Provides a good stretch to the chest muscles, improving flexibility and range of motion."),
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
          "Avoid Overstretching: Do not lower the weights beyond your comfort level to prevent shoulder injuries."),
    ],
  );
}

// ignore: must_be_immutable
class PR extends StatefulWidget {
  final String version;
  PR(this.version, {super.key});

  @override
  State<PR> createState() => _PRState();
}

class _PRState extends State<PR> {
  late TextEditingController controller;

  Future<void> changePR(BuildContext context, String version) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("$version:"),
            actions: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: "Enter your new value:",
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isNumeric(controller.text)) {
                    setState(() {
                      saveValue(widget.version, controller.text);
                    });
                    Navigator.of(context).pop();
                  } else {}
                },
                child: const Icon(
                  Icons.edit_note,
                ),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.version,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              FutureBuilder<dynamic>(
                future: getValue(widget.version),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "Error: ${snapshot.error}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  } else {
                    return Text(
                      snapshot.data ?? "0",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }
                },
              ),
              const Text(
                "kg",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint("Changed Bar");
            setState(() {
              changePR(context, widget.version);
            });
          },
          child: const Icon(Icons.edit),
        )
      ],
    );
  }
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
