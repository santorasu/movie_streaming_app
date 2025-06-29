import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/app_colors.dart';
import 'package:movie_streaming_app/app/asset_paths.dart';
import 'package:movie_streaming_app/features/movies/ui/screens/movie_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static final String name = "favorite_screen";

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<String> categories = ['All Categories', 'Movie', 'TV Series', 'Anime'];
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "My Favorites List",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.search, color: Colors.white),
                ],
              ),
              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    final isSelected = selectedCategory == index;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: isSelected ? AppColors.themeColor : Colors.white10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: Text(
                          categories[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: 0.80,
                  ),
                  itemBuilder: (context, index) {
                    return MovieCard(
                      imagePath: AssetPaths.moviePoster,
                      title: "Batman",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
