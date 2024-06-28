import 'package:flutter/material.dart';
import 'package:GymBro/preferences.dart';
import 'package:intl/intl.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 40,
        top: 40,
      ),
      child: Column(
        children: [
          todaysProgram(),
          ScheduleDay("Monday"),
          ScheduleDay("Tuesday"),
          ScheduleDay("Wednesday"),
          ScheduleDay("Thursday"),
          ScheduleDay("Friday"),
          ScheduleDay("Saturday"),
          ScheduleDay("Sunday"),
        ],
      ),
    );
  }
}

Widget todaysProgram() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: FutureBuilder<dynamic>(
      future: getValue(DateFormat('EEEE').format(date)),
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
          return Column(
            children: [
              const Text(
                "Today's program: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                (snapshot.data ?? "None"),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          );
        }
      },
    ),
  );
}

class ScheduleDay extends StatefulWidget {
  final String day;
  ScheduleDay(this.day, {super.key});

  @override
  State<ScheduleDay> createState() => _ScheduleDayState();
}

class _ScheduleDayState extends State<ScheduleDay> {
  late TextEditingController controller;
  Future<void> changeProgram(BuildContext context, String version) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("$version:"),
            actions: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: "Enter your new program:",
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    saveValue(version, controller.text);
                  });
                  Navigator.of(context).pop();
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
    var size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Container(
          height: size.height * 0.04,
          width: size.width * 0.25,
          padding: const EdgeInsets.all(2.5),
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            color: DateFormat('EEEE').format(date) == widget.day
                ? Colors.amber
                : Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Text(
              widget.day,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint("Edit");
            changeProgram(context, widget.day);
          },
          child: Container(
            height: size.height * 0.04,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              color: DateFormat('EEEE').format(date) == widget.day
                  ? Colors.amber
                  : Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: FutureBuilder<dynamic>(
                future: getValue(widget.day),
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
                      snapshot.data ?? "None",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
