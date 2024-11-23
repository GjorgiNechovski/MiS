import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final int id;
  final String name;
  const DetailTitle({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.9,
      child: Chip(
        backgroundColor: Colors.white,
        label: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "${name[0].toUpperCase()}${name.substring(1)}",
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
