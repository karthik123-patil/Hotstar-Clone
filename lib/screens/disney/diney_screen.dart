import 'package:flutter/material.dart';

import '../../widgets/header_widegt.dart';

class DisneyScreen extends StatefulWidget {
  const DisneyScreen({Key? key}) : super(key: key);

  @override
  State<DisneyScreen> createState() => _DisneyScreenState();
}

class _DisneyScreenState extends State<DisneyScreen> {
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
