import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/asset_paths.dart';
import 'package:movie_streaming_app/features/home/widgets/home_carousel_slider.dart';
import 'package:movie_streaming_app/features/movies/ui/screens/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCarouselSlider(),
            SizedBox(height: 16),
            _buildSectionHeader(title: 'Recommended For You', onTapSeeAll: () {}),
            _getMovieList(),
            _buildSectionHeader(title: 'Streamly Original', onTapSeeAll: () {}),
            _getMovieList(),
            _buildSectionHeader(title: 'Popular Movies', onTapSeeAll: () {}),
            _getMovieList(),
            _buildSectionHeader(
              title: 'Popular Animated Movies',
              onTapSeeAll: () {},
            ),
            _getMovieList(),
            _buildSectionHeader(title: 'Popular Drama', onTapSeeAll: () {}),
            _getMovieList(),
            _buildSectionHeader(title: 'TV Show', onTapSeeAll: () {}),
            _getMovieList(),
            _buildSectionHeader(title: 'Best Documentaries', onTapSeeAll: () {}),
            _getMovieList(),
            const SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}

Widget _buildSectionHeader({
  required String title,
  required VoidCallback onTapSeeAll,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        TextButton(onPressed: onTapSeeAll, child: Text('View all')),
      ],
    ),
  );
}




Widget _getMovieList() {
  return SizedBox(
    height: 250,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemBuilder: (context, index) {
        return MovieCard(
          imagePath: AssetPaths.moviePoster,
          title: 'Batman: Dark Knight',
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 8),
      itemCount: 10,
    ),
  );
}

