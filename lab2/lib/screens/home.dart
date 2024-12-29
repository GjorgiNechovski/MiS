import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lab2/screens/randomJoke.dart';
import 'package:lab2/services/apiService.dart';
import 'package:lab2/widgets/TypesGrid.dart';

import 'FavouriteJokes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> types = [];

  @override
  void initState() {
    super.initState();
    getTypesFromApi();
  }

  void getTypesFromApi() async {
    final response = await ApiService.getTypes();
    var data = List<String>.from(json.decode(response.body));
    setState(() {
      types = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Randomjoke()),
            );
          },
          icon: const Icon(Icons.looks_one_outlined),
        ),
        title: const Text(
          "211177 Lab2",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteJokesScreen()),
              );
            },
          ),
        ],
      ),
      body: TypesGrid(types: types),
    );
  }
}
