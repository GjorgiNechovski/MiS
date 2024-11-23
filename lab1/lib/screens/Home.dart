import 'package:flutter/material.dart';
import 'package:lab1/models/ClothingItem.dart';
import 'package:lab1/widgets/ClothingList.dart';
import '../services/clothingItemService.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<ClothingItem>> clothingItems;
  final ClothingItemService _clothingItemService = ClothingItemService();

  @override
  void initState() {
    super.initState();
    clothingItems = _clothingItemService.fetchClothingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "211177",
          style: TextStyle(color: Colors.white70, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ClothingItem>>(
        future: clothingItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (snapshot.hasData) {
            return ClothingList(clothingItems: snapshot.data!);
          }
          else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
