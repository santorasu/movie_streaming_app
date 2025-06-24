import 'package:flutter/material.dart';

class Movie_Details_TextButton extends StatelessWidget {
  const Movie_Details_TextButton({
    super.key,
    required this.subtitle,
    required this.onTap,
  });

  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(subtitle));
  }
}