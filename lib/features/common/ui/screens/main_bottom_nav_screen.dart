import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:movie_streaming_app/features/home/ui/home_screen.dart';
import 'package:movie_streaming_app/features/movie_details/ui/movie_details_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final String name = '/main-bottom-nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    MovieDetailsScreen(movieId: '123',),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (navController) {
        return Scaffold(
          body: _screens[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: navController.selectedIndex,
            onDestinationSelected: navController.changeIndex,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.stream_rounded),
                label: 'Live Stream',
              ),
              NavigationDestination(
                icon: Icon(Icons.library_music_rounded),
                label: 'Library',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline_rounded),
                label: 'Favorite',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded),
                label: 'Person',
              ),
            ],
          ),
        );
      },
    );
  }
}
