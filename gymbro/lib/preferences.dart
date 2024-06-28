import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var date = DateTime.now();

saveValue(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

getValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? stringValue = prefs.getString(key);
  return stringValue;
}

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

