import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/asset_paths.dart';
import 'package:movie_streaming_app/features/profile/ui/widgets/download_items.dart';
import 'package:movie_streaming_app/features/profile/ui/widgets/storage_card.dart';

class ProfileStorageScreen extends StatelessWidget {
  final List<Map<String, String>> downloads = [
    {
      "title": "Lightyear",
      "date": "Jan 13th",
      "size": "1.2 GB",
      "image": AssetPaths.dummyNikeShoePng,
    },
    {
      "title": "Top Gun: Maverick",
      "date": "Jan 26th",
      "size": "1.8 GB",
      "image": AssetPaths.dummyNikeShoePng,
    },
    {
      "title": "Lightyear",
      "date": "Feb 2nd",
      "size": "1.2 GB",
      "image": AssetPaths.dummyNikeShoePng,
    },
    {
      "title": "Lightyear",
      "date": "Feb 5th",
      "size": "1.4 GB",
      "image": AssetPaths.dummyNikeShoePng,
    },
    {
      "title": "Avatar",
      "date": "Feb 10th",
      "size": "1.8 GB",
      "image": AssetPaths.dummyNikeShoePng,
    },
    {
      "title": "Lightyear",
      "date": "Feb 14th",
      "size": "2.2 GB",
      "image": AssetPaths.dummyNikeShoePng,
    },
  ];

  ProfileStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0B1F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back_ios, color: Colors.white),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.search, color: Colors.white),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircularProgressIndicator(
                        value: 0.47,
                        strokeWidth: 10,
                        backgroundColor: Colors.white12,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.purple,
                        ),
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "60",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "GB Used",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Storage Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  storageCard("Total storage", "128 GB"),
                  storageCard("Free storage", "68 GB"),
                ],
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Downloaded",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.sort, color: Colors.white70),
                ],
              ),
              const SizedBox(height: 16),

              ...downloads.map((movie) => downloadItem(movie)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
