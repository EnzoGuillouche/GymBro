import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../preferences.dart';
import '../timer.dart';

class Dips extends StatefulWidget {
  const Dips({super.key});

  @override
  State<Dips> createState() => _DipsState();
}

class _DipsState extends State<Dips> {
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
          "Dips",
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
                      PR("Dips"),
                    ],
                  ),
                  Column(
                    children: [
                      title("PRs:"),
                      PR("DipsPR"),
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
          "assets/dips.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     Dips are a compound exercise that primarily targets the triceps, but also the chest (especially the lower portion) and the shoulders. \n\n     They can be performed using parallel bars or dip stations.",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          "assets/dipsM.png",
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
          "-  Position yourself between parallel bars or a dip station. Grip the bars firmly with your hands shoulder-width apart."),
      list(
          "- Lift your body off the ground by straightening your arms. Keep your torso slightly leaning forward to emphasize the chest muscles more. Cross your ankles or keep your legs straight for stability."),
      list(
          "- Slowly lower your body by bending your elbows until your upper arms are parallel to the ground or slightly below. Keep your elbows close to your body to protect your shoulders and focus on the triceps and chest."),
      list(
          "- Push your body back up to the starting position by straightening your arms. Exhale as you press up, and keep the movement controlled."),
      list(
          "- Continue the movement for the desired number of repetitions, ensuring proper form throughout."),
      list(
          "- Repeat the movement for the desired number of repetitions. Ensure proper form throughout to prevent injury."),
      list(
          "- After completing your set, carefully lower your body back to the ground by bending your knees and stepping off the bars."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Targets Chest and Triceps: Engages the pectoralis major (especially the lower part) and the triceps brachii."),
      list(
          "Shoulder Involvement: Works the anterior deltoids (front shoulder muscles)."),
      list(
          "Strengthens Upper Body: Improves overall upper body strength and stability."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Proper Form: Maintain a slight forward lean to target the chest more effectively. Avoid excessive forward or backward leaning to prevent shoulder strain."),
      list(
          "Controlled Movement: Perform the exercise in a controlled manner to avoid injury and maximize muscle engagement."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
      list(
          "Range of Motion: Do not lower yourself too far down to avoid excessive strain on the shoulder joints. Aim for your upper arms to be parallel to the ground."),
      list(
          "Avoid Locking Elbows: Keep a slight bend in your elbows at the top of the movement to maintain tension on the muscles and protect your joints."),
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
                      saveValue(version, controller.text);
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
                style: const TextStyle(
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
