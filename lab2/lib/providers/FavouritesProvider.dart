import 'package:flutter/cupertino.dart';

import '../models/Joke.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Joke> _favoriteJokes = [];

  List<Joke> get favoriteJokes => List.unmodifiable(_favoriteJokes);

  void toggleFavorite(Joke joke) {
    if (_favoriteJokes.contains(joke)) {
      _favoriteJokes.remove(joke);
    } else {
      _favoriteJokes.add(joke);
    }
    notifyListeners();
  }

  bool isFavorite(Joke joke) => _favoriteJokes.contains(joke);
}