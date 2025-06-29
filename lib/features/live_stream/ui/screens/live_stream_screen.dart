import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/asset_paths.dart';
import 'package:movie_streaming_app/features/live_stream/ui/widgets/live_stream_card.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});
  static final String name = "/live_stream";

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  int selectedTab = 0;
  final List<String> tabs = ["All", "Popular", "Following"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181028),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Search Box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Search Box Section
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.white54),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: const TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Microphone Icon
                    const SizedBox(width: 8),
                    const Icon(Icons.mic, color: Colors.white54),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              // Segmented Control
              Row(
                children: List.generate(tabs.length, (i) {
                  final isSelected = selectedTab == i;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTab = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.purple : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            tabs[i],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              const Text(
                "Ongoing Live Stream",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Grid of live streams
              GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.90,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AssetPaths.moviePoster,
                            fit: BoxFit.cover,
                            height: 140,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Streamer Info
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage(AssetPaths.moviePoster),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Santo Rasu",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '12k followers',
                                    style: TextStyle(color: Colors.white54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
