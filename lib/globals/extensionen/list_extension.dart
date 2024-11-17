
extension ListExtension<T> on List<T> {
  List<T>  replaceAt(int index, T element) {
    if (index < 0 || index >= length) {
      throw RangeError.index(index, this, 'index', null, length);
    }
    final List<T> copy = List<T>.from(this);
    copy[index] = element;
    return copy;
  }
}