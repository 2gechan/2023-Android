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
      // 위젯의 배경색상을 투명하게 만들어서 이미지를 보이게 해줌
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              strTimer,
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Colors.blue),
            ),
            Text(
              strTimer,
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w900,
                color: Colors.amber,
              ),
            ),
            // IconButton(
            //   onPressed: onPressed,
            //   icon: timerRun
            //       ? const Icon(Icons.stop_circle)
            //       : const Icon(Icons.play_circle_fill),
            // )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Colors.white38,
          isExtended: true,
          child: Icon(
            timerRun ? Icons.pause : Icons.play_arrow_rounded,
            size: 60,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
