class CounterProvider {
  int _count = 0;

  int increaseCount() {
    this._count++;
    return this._count;
  }

  int get currentValue => this._count;
}
