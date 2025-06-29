import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/app_colors.dart';

Future<void> showShareBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.themeColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Share to',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _ShareIcon(icon: Icons.call_rounded, label: 'WhatsApp'),
                _ShareIcon(icon: Icons.facebook, label: 'Facebook'),
                _ShareIcon(icon: Icons.camera_alt, label: 'Instagram'),
                _ShareIcon(icon: Icons.video_library, label: 'TikTok'),
                _ShareIcon(icon: Icons.alternate_email, label: 'Twitter'),
                _ShareIcon(icon: Icons.business, label: 'LinkedIn'),
                _ShareIcon(icon: Icons.message, label: 'Messenger'),
                _ShareIcon(icon: Icons.link, label: 'Copy URL'),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}

class _ShareIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ShareIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        // Add your share logic here if needed
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(icon, color: AppColors.themeColor),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
