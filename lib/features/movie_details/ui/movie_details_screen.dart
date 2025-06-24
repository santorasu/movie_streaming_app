import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/app_colors.dart';
import 'package:movie_streaming_app/app/asset_paths.dart';
import 'package:movie_streaming_app/features/home/widgets/app_bar_icon_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  static final String name = "/movie_details";

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    // Movie Poster
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        AssetPaths.moviePoster,
                        fit: BoxFit.fill,
                        height: 420,
                      ),
                    ),

                    // Positioned Icons (Back and Cast)
                    Positioned(
                      top: 40, // Adjust this value to place the icons correctly
                      left: 16,
                      child: AppBarIconButton(
                        onTap: () {},
                        iconData: Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 40, // Adjust this value to place the icons correctly
                      right: 16,
                      child: AppBarIconButton(
                        onTap: () {},
                        iconData: Icons.cast,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Watch Now button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Watch Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Icon Buttons
                      Row(
                        children: [
                          AppBarIconButton(
                            onTap: () {},
                            iconData: Icons.download,
                            color: AppColors.themeColor,
                          ),
                          AppBarIconButton(
                            onTap: () {},
                            iconData: Icons.share,
                            color: AppColors.themeColor,
                          ),
                          AppBarIconButton(
                            onTap: () {},
                            iconData: Icons.bookmark_border,
                            color: AppColors.themeColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
