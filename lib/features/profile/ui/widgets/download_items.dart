import 'package:flutter/material.dart';

Widget downloadItem(Map<String, String> movie) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            movie['image']!,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(movie['date']!, style: const TextStyle(color: Colors.white54, fontSize: 12)),
              Text(movie['size']!, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          child: const Text("Delete", style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}