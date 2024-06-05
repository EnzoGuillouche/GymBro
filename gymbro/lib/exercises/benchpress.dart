import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../timer.dart';

class BenchPress extends StatefulWidget {
  const BenchPress({super.key});

  @override
  State<BenchPress> createState() => _BenchPressState();
}

class _BenchPressState extends State<BenchPress> {
  String barPR = "3";
  String dumbbelPR = "5";
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
          "Bench Press",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: barIndex == 0 ? SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            title("PRs:"),
            PR(barPR, "Bar"),
            PR(dumbbelPR, "Dumbbel"),
            description(),
            steps(),
            benefits(),
            safetyTips(),
          ],
        ),
      ) : Timer(),
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
          "assets/benchpressB.png",
          width: 300,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          "     The bench press is a strength training \nexercise that primarily targets the chest \nmuscles (pectoralis major), but also \nengages the triceps and shoulders. \n\n     It is performed using a barbell or \ndumbbells while lying on a bench.",
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
          "- Lie flat on your back on a bench with your feet firmly planted on the ground. Your eyes should be directly under the bar if using a barbell."),
      list(
          "- Grip the barbell with hands slightly wider than shoulder-width apart. Ensure a firm, even grip to maintain control of the weight."),
      list(
          "- Lift the bar off the rack with your arms fully extended, positioning it directly above your chest."),
      list(
          "- Slowly lower the bar to your chest by bending your elbows. The bar should touch your chest at the mid-pec level, around the nipple line. Keep your elbows at about a 45-degree angle to your body to reduce shoulder strain."),
      list(
          "- Push the bar back up to the starting position by extending your arms. Exhale as you press the weight up, and keep the movement controlled."),
      list(
          "- Repeat the movement for the desired number of repetitions. Ensure proper form throughout to prevent injury."),
      list(
          "- After completing your set, carefully return the bar to the rack by straightening your arms and guiding the bar back onto the supports."),
    ],
  );
}

Widget benefits() {
  return Column(
    children: [
      title("Benefits"),
      list(
          "Strengthens Chest: Primarily targets the pectoralis major muscles."),
      list(
          "Engages Upper Body Muscles: Works the triceps, anterior deltoids (front shoulders), and to a lesser extent, the muscles of the upper back."),
      list(
          "Improves Upper Body Strength: Essential for overall upper body strength and stability."),
    ],
  );
}

Widget safetyTips() {
  return Column(
    children: [
      title("Safety Tips"),
      list(
          "Use a Spotter: Especially when lifting heavy weights, to help if you struggle to lift the bar."),
      list("Maintain Proper Form: To avoid shoulder or lower back injuries."),
      list(
          "Warm-Up: Ensure proper warm-up to prepare the muscles and joints for the exercise."),
    ],
  );
}

// ignore: must_be_immutable
class PR extends StatefulWidget {
  String pr;
  final String version;
  PR(this.pr, this.version, {super.key});

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
            title: Text("$version PR:"),
            actions: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: "New PR",
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isNumeric(controller.text)) {
                    setState(() {
                      widget.pr = controller.text;
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
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                widget.pr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                "kg",
                style: const TextStyle(
                  fontSize: 20,
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
