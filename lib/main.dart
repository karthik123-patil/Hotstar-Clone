import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar_clone/screens/dashboard/home_screen.dart';
import 'package:hotstar_clone/utils/colors.dart';
import 'package:hotstar_clone/widgets/bottom_navigationbar.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontFamily: "RobotoSlabBold"),
          headline2: TextStyle(color:AppColors.whiteColor, fontSize: 14, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
          headline3: TextStyle(color:Colors.white38, fontSize: 10, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabLight", fontStyle: FontStyle.normal),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const MyHomePage(title: 'Hotstar Clone'),
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
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/hotstar.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    startApplication();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void startApplication() async{
    Timer(const Duration(milliseconds: 3000), () async{
      Get.to(const BottomNavScreen());
    });
  }
}