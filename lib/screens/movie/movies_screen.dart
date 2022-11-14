import 'package:flutter/material.dart';

import '../../widgets/header_widegt.dart';
class MoviesScreens extends StatefulWidget {
  const MoviesScreens({Key? key}) : super(key: key);

  @override
  State<MoviesScreens> createState() => _MoviesScreensState();
}

class _MoviesScreensState extends State<MoviesScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBarWidget(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
