import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/FavouritesProvider.dart';

class FavoriteJokesScreen extends StatelessWidget {
  const FavoriteJokesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteJokes = favoritesProvider.favoriteJokes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
        backgroundColor: Colors.black12,
      ),
      body: favoriteJokes.isEmpty
          ? const Center(
        child: Text(
          'No favorite jokes yet!',
          style: TextStyle(fontSize: 18.0),
        ),
      )
          : ListView.builder(
        itemCount: favoriteJokes.length,
        itemBuilder: (context, index) {
          final joke = favoriteJokes[index];
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListTile(
              title: Text(joke.setup),
              subtitle: Text(joke.punchline),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  favoritesProvider.toggleFavorite(joke);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
