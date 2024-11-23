import 'package:flutter/material.dart';

class ClothingItemCardData extends StatelessWidget {
  final String image;
  final String title;

  const ClothingItemCardData({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 7,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 200,
            ),
            child: Image.network(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),

        const Divider(),
        Flexible(
          flex: 3,
          child: Text(
            title.length > 100
                ? "${title.substring(0, 100)}..."
                : "${title[0].toUpperCase()}${title.substring(1)}",
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
