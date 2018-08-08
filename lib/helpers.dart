Iterable conj(iterable, elem) {
  iterable.add(elem);
  return iterable;
}

Map assoc(map, key, value) {
  map.update(key, (v) => value);
  return map;
}