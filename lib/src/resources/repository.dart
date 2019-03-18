import 'package:flutter_bloc/src/models/item_model.dart';
import 'package:flutter_bloc/src/resources/movies_api_provider.dart';

class Repository {
  final MoviesApiProvider _moviesApiProvider = MoviesApiProvider();

  Future<ItemModel> fetchMovieList() => this._moviesApiProvider.fetchMovieList();
}