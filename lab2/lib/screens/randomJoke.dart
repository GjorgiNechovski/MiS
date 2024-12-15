import 'package:flutter/material.dart';

import '../models/Joke.dart';
import '../services/apiService.dart';

class Randomjoke extends StatefulWidget {
  const Randomjoke({super.key});

  @override
  State<Randomjoke> createState() => RandomjokeState();
}

class RandomjokeState extends State<Randomjoke> {
  Joke? joke;

  @override
  void initState() {
    super.initState();
    getJoke();
  }

  void getJoke() async {
    ApiService.getRandomJoke().then((response) {
      setState(() {
        joke = Joke.fromJson(response);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text('Random Joke', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: joke == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              joke!.setup,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              joke!.punchline,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
