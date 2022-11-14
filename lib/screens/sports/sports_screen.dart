import 'package:flutter/material.dart';

import '../../widgets/header_widegt.dart';
class SportsScreen extends StatefulWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
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
