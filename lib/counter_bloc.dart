import 'package:rxdart/subjects.dart';

import 'package:flutter_bloc/counter_provider.dart';

class CounterBloc {
  final PublishSubject<int> _counterObservable = PublishSubject();
  final CounterProvider _provider = CounterProvider();

  Stream get counterStream => this._counterObservable.stream;
  int get currentValue => this._provider.currentValue;

  void updateCount() {
    final int count = this._provider.increaseCount();
    this._counterObservable.sink.add(count);
  }

  void dispose() {
    _counterObservable.close();
  }
}

final counterBloc = CounterBloc();
