import 'package:rxdart/subjects.dart';

import 'package:flutter_bloc/counter_provider.dart';

class CounterBloc {
  final BehaviorSubject<int> _counterObservable = BehaviorSubject();
  final CounterProvider _provider = CounterProvider();

  Stream get counterStream => _counterObservable.stream;
  int get currentValue => _counterObservable.value;

  void updateCount() {
    final int count = this._provider.increaseCount();
    this._counterObservable.sink.add(count);
  }

  void dispose() {
    _counterObservable.close();
  }
}

final counterBloc = CounterBloc();
