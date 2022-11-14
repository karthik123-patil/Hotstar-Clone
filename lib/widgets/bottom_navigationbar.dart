import 'package:flutter/material.dart';
import 'package:hotstar_clone/screens/dashboard/home_screen.dart';
import 'package:hotstar_clone/screens/disney/diney_screen.dart';
import 'package:hotstar_clone/screens/movie/movies_screen.dart';
import 'package:hotstar_clone/screens/sports/sports_screen.dart';
import '../screens/tv/tv_screens.dart';
import '../utils/colors.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    const HomeScreen(),
    const TvShowsScreen(),
    const DisneyScreen(),
    const MoviesScreens(),
    const SportsScreen(),
  ];
  int _currentIndex = 0;
  final List _label = [
    "Home",
    "Tv",
    "Disney",
    "Movies",
    "Sports"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white30,
        selectedItemColor: Colors.white,
        unselectedIconTheme: const IconThemeData(
          color: Colors.white30,
        ),
        selectedLabelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
            fontStyle: FontStyle.normal,
            fontFamily: "RobotoSlabMedium"
        ),
        selectedIconTheme: const IconThemeData(
            color: AppColors.whiteColor
        ),
        unselectedLabelStyle: const TextStyle(
            color: Colors.white30,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
            fontStyle: FontStyle.normal,
            fontFamily: "RobotoSlabMedium"
        ),
        elevation: 2.0,
        items: [Icons.home_filled, Icons.tv_outlined, Icons.tv, Icons.movie_outlined, Icons.sports_cricket_rounded]
            .asMap()
            .map((key, value) => MapEntry(key,
          BottomNavigationBarItem(
            label: key == 2 ? "" : _label[key],
            icon: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 8.0,
              ),
              child: key == 2 ? Image.asset("assets/images/icon_disney.png", color: _currentIndex == key ? AppColors.whiteColor : Colors.white30, scale: 1.5,) : Icon(value),
            ),
          ),
        )).values.toList(),
      ),
    );
  }
}