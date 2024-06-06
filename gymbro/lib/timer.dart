import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

// ignore: must_be_immutable
class Timer extends StatefulWidget {
  Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  int time = 0;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  bool timeSpending = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              debugPrint("Tapped the timer");
              if (timeSpending) {
                timeSpending = false;
                _stopWatchTimer.onStopTimer();
              } else {
                timeSpending = true;
                _stopWatchTimer.onStartTimer();
              }
            },
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(200)),
              ),
              child: StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: 0,
                builder: (context, snap) {
                  final value = snap.data;
                  final displayTime = StopWatchTimer.getDisplayTime(value!);
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        displayTime,
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              debugPrint("Reset");
              _stopWatchTimer.onResetTimer();
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: const Center(
                child: Text(
                  "Reset",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
