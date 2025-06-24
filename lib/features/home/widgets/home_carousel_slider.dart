import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/app_colors.dart';
import 'package:movie_streaming_app/app/asset_paths.dart';

import 'app_bar_icon_button.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 420,
                viewportFraction: 1,
                onPageChanged: (index, _) {
                  _currentSlider.value = index;
                },
              ),
              items: List.generate(5, (index) {
                return Stack(
                  children: [
                    // Background image
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        AssetPaths.moviePoster,
                        fit: BoxFit.fill,
                      ),
                    ),
                    // Gradient overlay
                    Container(
                      width: double.infinity,
                      height: 420,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),

                    //Search bar and alarm icon
                    Positioned(
                      top: 50,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Search bar
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.search, color: Colors.white70),
                                  SizedBox(width: 8),
                                  Text(
                                    "Search",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          // Alarm Icon
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.1),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Text and buttons
                    Positioned(
                      left: 16,
                      bottom: 30,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow[700],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "IMDb",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "8.2/10",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Companion",
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 16),
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
                                    iconData: Icons.download, color: AppColors.themeColor,
                                  ),
                                  AppBarIconButton(
                                    onTap: () {},
                                    iconData: Icons.share, color: AppColors.themeColor,
                                  ),
                                  AppBarIconButton(
                                    onTap: () {},
                                    iconData: Icons.bookmark_border, color: AppColors.themeColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 16),
        ValueListenableBuilder(
          valueListenable: _currentSlider,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                return Container(
                  width: 24,
                  height: 8,
                  margin: EdgeInsets.only(left: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                    color: index == i ? AppColors.themeColor : Colors.white,
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
