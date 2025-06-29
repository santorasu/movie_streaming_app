import 'package:flutter/material.dart';

class LiveStreamCard extends StatelessWidget {
  final String username;
  final String followers;
  final String imageUrl;
  final bool isLive;

  const LiveStreamCard({
    super.key,
    required this.username,
    required this.followers,
    required this.imageUrl,
    this.isLive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // User image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        // Overlay gradient
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            ),
          ),
        ),
        // Live badge and info
        Positioned(
          top: 8,
          left: 8,
          child: isLive
              ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Live",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          )
              : const SizedBox.shrink(),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          right: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  shadows: [Shadow(color: Colors.black, blurRadius: 3)],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                followers,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  shadows: [Shadow(color: Colors.black, blurRadius: 3)],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}