import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/app/app_colors.dart';
import 'package:movie_streaming_app/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:movie_streaming_app/features/home/ui/screens/home_screen.dart';
import 'package:movie_streaming_app/features/live_stream/ui/screens/live_stream_screen.dart';
import 'package:movie_streaming_app/features/movie_details/ui/screens/movie_details_screen.dart';
import 'package:movie_streaming_app/features/my_favourite/ui/screens/my_favourite_screen.dart';
import 'package:movie_streaming_app/features/profile/ui/screens/profile_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final String name = '/main-bottom-nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    LiveStreamScreen(),
    MovieDetailsScreen(movieId: '123',),
    FavoriteScreen(),
    ProfileStorageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (navController) {
        return Scaffold(
          body: _screens[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.black,
            indicatorColor: AppColors.themeColor,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.white),
            ),
            selectedIndex: navController.selectedIndex,
            onDestinationSelected: navController.changeIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home,color: Colors.white,),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.stream_rounded,color: Colors.white),
                label: 'Live Stream',
              ),
              NavigationDestination(
                icon: Icon(Icons.library_music_rounded,color: Colors.white),
                label: 'Library',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline_rounded,color: Colors.white),
                label: 'Favorite',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded,color: Colors.white),
                label: 'Person',
              ),
            ],
          ),
        );
      },
    );
  }
}
