import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartStopBtn extends StatefulWidget {
  StartStopBtn({Key? key, required this.onTapped, required this.isPlay}) : super(key: key);

  bool isPlay;
  final VoidCallback onTapped;

  @override
  State<StartStopBtn> createState() => _StartStopBtnState();
}

class _StartStopBtnState extends State<StartStopBtn> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.isPlay ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
      onPressed: widget.onTapped,
    );
  }
}