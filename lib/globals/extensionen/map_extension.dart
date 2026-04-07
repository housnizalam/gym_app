

// ignore_for_file: unnecessary_this

extension MapSorting on Map<String, double> {
  Map<String, double> sortByValue() {
    if(isEmpty){
      return {};
    }
    if(this.length==1){
      return this;
    }
    final sortedKeys = keys.toList(growable: false)
      ..sort((k1, k2) => this[k2]!.compareTo(this[k1]!));
    final sortedMap = { for (var k in sortedKeys) k : this[k]! };
    return sortedMap;
  }
}