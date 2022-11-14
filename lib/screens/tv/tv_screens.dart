import 'package:flutter/material.dart';
import 'package:hotstar_clone/widgets/header_widegt.dart';

class TvShowsScreen extends StatefulWidget {
  const TvShowsScreen({Key? key}) : super(key: key);

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
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
