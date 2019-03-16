import 'package:rxdart/rxdart.dart';

import 'package:flutter_bloc/src/models/item_model.dart';
import 'package:flutter_bloc/src/resources/repository.dart';

class MoviesBloc {
  final Repository _repository = Repository();
  final PublishSubject<ItemModel> _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();