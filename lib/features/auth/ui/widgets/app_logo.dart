import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_streaming_app/app/asset_paths.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPaths.appLogo,
      width: width ?? 140,
      height: height ?? width ?? 140,
      fit: BoxFit.scaleDown,
    );
  }
}
