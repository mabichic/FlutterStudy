import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int constTime = 1500;
  int totalPomodoro = 0;
  int time = constTime;
  late Timer timer;
  bool isRunning = false;

  void onTick(Timer timer) {
    if (time == 0) {
      setState(() {
        time = constTime;
        isRunning = false;
        totalPomodoro++;
        timer.cancel();
      });
    } else {
      setState(() {
        time -= 1;
      });
    }
  }

  void onReset() {
    setState(() {
      isRunning = false;
      timer.cancel();
      time = constTime;
    });
  }

  void onPressed() {
    setState(() {
      isRunning = true;
      timer = Timer.periodic(
        const Duration(seconds: 1),
        onTick,
      );
    });
  }

  void onStopPressed() {
    setState(() {
      isRunning = false;
      timer.cancel();
    });
  }

  String format(int seconds) {
    Duration duration = Duration(seconds: seconds);

    return "${duration.toString().split('.')[0].split(':')[1]}:${duration.toString().split('.')[0].split(':')[2]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(time),
                style: TextStyle(
                  fontSize: 98,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Center(
                child: Column(
                  children: [
                    IconButton(
                        iconSize: 180,
                        color: Theme.of(context).cardColor,
                        onPressed: !isRunning ? onPressed : onStopPressed,
                        icon: !isRunning
                            ? const Icon(
                                Icons.play_circle_outline,
                              )
                            : const Icon(Icons.pause_circle_outline)),
                    IconButton(
                      iconSize: 50,
                      color: Theme.of(context).cardColor,
                      onPressed: onReset,
                      icon: const Icon(
                        Icons.restore_outlined,
                      ),
                    )
                  ],
                ),
              )),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      Text(
                        'Pomodoros',
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).textTheme.headline1!.color,
                        ),
                      ),
                      Text(
                        '$totalPomodoro',
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontSize: 80),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
