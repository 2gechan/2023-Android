import 'package:flutter/material.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String _formatTime(seconds) {
    var duration = Duration(seconds: seconds);
    // return duration.toString();
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    // context.select((value) => null);
    // context.watch();
    // context.read();

    var strTimer = context.select<TimerViewModel, String>(
      (value) => _formatTime(value.timerDto.timer),
    );
    var timerRun = context.select<TimerViewModel, bool>(
      (value) => value.timerDto.timerRun,
    );

    var onPressed = context.select<TimerViewModel, Function()>(
      (value) => value.onPressed,
    );

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            strTimer,
          ),
          IconButton(
            onPressed: onPressed,
            icon: timerRun
                ? const Icon(Icons.stop_circle)
                : const Icon(Icons.play_circle_fill),
          )
        ],
      )),
    );
  }
}
