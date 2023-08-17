sealed class Sort {
  const Sort(this.column, [this.descending = false]);

  final String column;
  final bool descending;
}

class NameASC extends Sort {
  const NameASC() : super('name');
}

class NameDESC extends Sort {
  const NameDESC() : super('name', true);
}

class PriceASC extends Sort {
  const PriceASC() : super('price');
}

class PriceDESC extends Sort {
  const PriceDESC() : super('price', true);
}
