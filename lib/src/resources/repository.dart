import 'dart:async';

import 'package:flutter_bloc/src/models/item_model.dart';
import 'package:flutter_bloc/src/resources/movie_api_provider.dart';

class Repository {
  final MovieApiProvider moviesApiProvider = MovieApiProvider();
  
  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
