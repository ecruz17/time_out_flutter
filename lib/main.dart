import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//WIDGETS
import 'src/Buttons/start_stop_btn.dart';
import 'src/Widgets/notifications.dart';
import 'src/Widgets/timer.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
FlutterLocalNotificationsPlugin();

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings =
        // ignore: prefer_const_constructors
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

void main() {
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Out',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Time Out Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Notifications.initialize(flutterLocalNotificationsPlugin);   
  }

  final CountDownController controller = CountDownController();
  bool isPlay = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Time Out!'),
      ),
      body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: todo
                  //TODO: Add time picker input
                  IconButton(onPressed: _showTimePicker, icon: const Icon(Icons.access_alarm_sharp)),
                  Timer(controller: controller, isPlay: isPlay),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StartStopBtn(
                            onTapped: () {
                          setState(() {
                            isPlay = !isPlay;
                          });
                          isPlay ?
                          controller.pause() : controller.resume();
                        },
                            isPlay: isPlay,         
                          ),
                          IconButton(
                              icon: const Icon(Icons.stop),
                              onPressed: () {
                                controller.restart();
                                Notifications.showBigTextNotification(title: 'Basta!', body: 'Hora de descansito',
                              fln: flutterLocalNotificationsPlugin);
                                setState(() {
                                  isPlay = !isPlay;
                                });
                                isPlay ? controller.pause() : controller.resume();
                              }),
                        ]),
                  ),
                ],
              ),
            ),
        );
  }

  _showTimePicker() {

  }
}
