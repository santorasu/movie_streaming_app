import 'package:flutter/material.dart';
import 'package:movie_streaming_app/features/auth/ui/screens/splash_screen.dart';
import 'package:movie_streaming_app/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:movie_streaming_app/features/movie_details/ui/movie_details_screen.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;
    if (settings.name == SplashScreen.name) {
      screenWidget = const SplashScreen();
    } else if (settings.name == MainBottomNavScreen.name) {
      screenWidget = MainBottomNavScreen();
    } else if (settings.name == MovieDetailsScreen.name) {
      final String productId = settings.arguments as String;
      screenWidget = MovieDetailsScreen(movieId: productId);
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
