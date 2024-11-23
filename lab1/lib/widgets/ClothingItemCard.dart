import 'package:flutter/material.dart';
import 'package:lab1/models/ClothingItem.dart';

import 'ClothingItemCardData.dart';


class ClothingItemCard extends StatelessWidget {
  final ClothingItem clothingItem;

  const ClothingItemCard({super.key, required this.clothingItem}); // Fixed constructor.

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        enableFeedback: true,
        onTap: () {
          Navigator.pushNamed(
              context,
              "/details",
              arguments: ClothingItem(
                id: clothingItem.id,
                title: clothingItem.title,
                image: clothingItem.image,
                price: clothingItem.price,
                description: clothingItem.description
              )
          );
        }, // Fixed 'onTap' closure.

        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal.withOpacity(0.8), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClothingItemCardData(
            title: clothingItem.title,
            image: clothingItem.image,
          ),
        ),
      ),
    );
  }
}
