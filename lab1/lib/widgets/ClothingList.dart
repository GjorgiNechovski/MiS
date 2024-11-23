import 'package:flutter/cupertino.dart';
import 'package:lab1/models/ClothingItem.dart';

import 'ClothingItemCard.dart';

class ClothingList extends StatefulWidget {
  final List<ClothingItem> clothingItems;

  const ClothingList({super.key, required this.clothingItems});

  @override
  ClothingListState createState() => ClothingListState();
}
class ClothingListState extends State<ClothingList> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      semanticChildCount: 250,
      physics: const BouncingScrollPhysics(),
      children: widget.clothingItems.map((clothingItem) =>
          ClothingItemCard(clothingItem: clothingItem),
      ).toList(),
    );
  }
}
