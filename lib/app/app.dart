import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/app_routes.dart';
import 'package:movie_streaming_app/app/app_theme.dart';
import 'package:movie_streaming_app/features/auth/ui/screens/splash_screen.dart';

class MovieStreamingApp extends StatefulWidget {
  const MovieStreamingApp({super.key});

  @override
  State<MovieStreamingApp> createState() => _MovieStreamingAppState();
}

class _MovieStreamingAppState extends State<MovieStreamingApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
