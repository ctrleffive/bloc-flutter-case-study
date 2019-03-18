import 'package:flutter_bloc/src/models/item_model.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_bloc/src/resources/repository.dart';

class MoviesBloc {
  final Repository _repository = Repository();
  final PublishSubject<ItemModel> _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => this._moviesFetcher.stream;

  Future<void> fetchAllMovies() async {
    try {
      final ItemModel itemModel = await this._repository.fetchMovieList();
      this._moviesFetcher.sink.add(itemModel);
    } catch (e) {}
  }

  void dispose() {
    _moviesFetcher.close();
  }
}

final moviesBloc = MoviesBloc();