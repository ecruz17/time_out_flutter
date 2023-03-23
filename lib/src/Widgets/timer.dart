import 'package:flutter/material.dart';
//WIDGETS
import 'package:neon_circular_timer/neon_circular_timer.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key, required this.controller, required this.isPlay}) : super(key: key);

  final CountDownController controller;
  final bool isPlay;

  @override
  Widget build(BuildContext context) {
    return NeonCircularTimer(
                      onComplete: () {
                        controller.pause();
                      },
                      width: 200,
                      controller: controller,
                      duration: 20,
                      strokeWidth: 10,
                      isTimerTextShown: true,
                      neumorphicEffect: true,
                      outerStrokeColor: Colors.grey.shade100,
                      innerFillGradient: LinearGradient(colors: [
                        Colors.greenAccent.shade200,
                        Colors.blueAccent.shade400
                      ]),
                      neonGradient: LinearGradient(colors: [
                        Colors.greenAccent.shade200,
                        Colors.blueAccent.shade400
                      ]),
                      strokeCap: StrokeCap.round,
                      innerFillColor: Colors.black12,
                      backgroudColor: Colors.grey.shade100,
                      neonColor: Colors.blue.shade900);             
  }
}