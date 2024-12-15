import 'package:flutter/material.dart';
import 'package:lab2/services/apiService.dart';
import '../models/Joke.dart';

class JokesList extends StatefulWidget {
  final String type;

  const JokesList({Key? key, required this.type}) : super(key: key);

  @override
  State<JokesList> createState() => JokesListState();
}

class JokesListState extends State<JokesList> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    getJokesFromApi();
  }

  void getJokesFromApi() {
    ApiService.getJokesForType(widget.type).then((response) {
      setState(() {
        jokes = List<Map<String, dynamic>>.from(response)
            .map((joke) => Joke.fromJson(joke))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes'),
        backgroundColor: Colors.black12,
      ),
      body: jokes.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListTile(
              title: Text(joke.setup),
              subtitle: Text(joke.punchline),
            ),
          );
        },
      ),
    );
  }
}
