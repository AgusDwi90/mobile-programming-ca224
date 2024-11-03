import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAction extends StatelessWidget {
  const PostAction({
    super.key,
    required this.asset,
    required this.label,
  });
  final String asset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: SvgPicture.asset(
            asset,
            colorFilter: const ColorFilter.mode(
              Colors.white70,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {},
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
