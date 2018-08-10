Iterable conj(iterable, elem) {
  iterable.add(elem);
  return iterable;
}

Map assoc(map, key, value) {
  map.update(key, (v) => value);
  return map;
}

// Not better than just
dynamic when(test, expr) {
  return test ? expr() : null;
}


// Quite a few improvements could be made.
// Even as shorter name (e.g. cond ?) and variable number of params.
// Also, how to handle wild-card matching?
class Tuple {

  final dynamic t1;
  final dynamic t2;

  Tuple(this.t1, this.t2);

  @override
  bool operator ==(other) {
    return other is Tuple &&
        other.t1 == this.t1 &&
        other.t2 == this.t2;
  }

  //  hash is used in dictionary lookups
  @override
  int get hashCode => t1.hashCode ^ t2.hashCode;


}