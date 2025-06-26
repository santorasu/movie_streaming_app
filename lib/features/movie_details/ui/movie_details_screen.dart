import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/app/app_colors.dart';
import 'package:movie_streaming_app/app/asset_paths.dart';
import 'package:movie_streaming_app/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:movie_streaming_app/features/home/widgets/app_bar_icon_button.dart';
import 'package:movie_streaming_app/features/movies/ui/widgets/movie_details_text_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movieId});

  static final String name = "/movie_details";
  final String movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AssetPaths.moviePoster,
                    fit: BoxFit.fill,
                    height: 420,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 60,
                    left: 16,
                    child: AppBarIconButton(
                      onTap: () {
                        Get.find<MainBottomNavController>().backToHome();
                      },
                      iconData: Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 16,
                    child: AppBarIconButton(
                      onTap: () {},
                      iconData: Icons.cast,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Batman: Dark Knight',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.themeColor,
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "8.2/10",
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.themeColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '2025',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Movie_Details_TextButton(
                      subtitle: 'Subtitle',
                      onTap: () {},
                    ),
                    Movie_Details_TextButton(
                      subtitle: 'United States',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
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
                      child: Row(
                        children: [
                          Icon(Icons.play_circle, color: Colors.white),
                          SizedBox(width: 16),
                          Text(
                            'Play',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    AppBarIconButton(
                      onTap: () {},
                      iconData: Icons.download,
                      color: AppColors.themeColor,
                    ),
                    AppBarIconButton(
                      onTap: () {
                        _shareToSocialMedia();
                      },
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
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Genre: Drama, Action, Comedy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Synopsis',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Why is 'The Dark Knight' so highly rated? The main elements of “The Dark Knight” that make the film so good are character development and storytelling. Three characters in particular make the film the masterpiece it is: Batman/Bruce Wayne, Harvey Dent and the Joker (Heath Ledger).",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      maxLines: _isExpanded ? null : 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        _isExpanded ? "View Less" : "View More",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _shareToSocialMedia() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.themeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Share to',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _shareIcon(Icons.call_rounded, 'WhatsApp'),
                  _shareIcon(Icons.facebook, 'Facebook'),
                  _shareIcon(Icons.camera_alt, 'Instagram'),
                  _shareIcon(Icons.video_library, 'TikTok'),
                  _shareIcon(Icons.alternate_email, 'Twitter'),
                  _shareIcon(Icons.business, 'LinkedIn'),
                  _shareIcon(Icons.message, 'Messenger'),
                  _shareIcon(Icons.link, 'Copy URL'),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _shareIcon(IconData icon, String label) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(icon, color: AppColors.themeColor),
          ),
          SizedBox(height: 6),
          Text(
            label,  
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
