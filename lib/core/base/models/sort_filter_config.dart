typedef SortSelector<T> = Comparable Function(T item);
typedef FilterPredicate<T> = bool Function(T item);

class SortOption<T> {
  final String label;
  final SortSelector<T> selector;
  final bool ascending;

  SortOption({
    required this.label,
    required this.selector,
    this.ascending = true,
  });
}

class FilterOption<T> {
  final String label;
  final FilterPredicate<T> predicate;

  FilterOption({required this.label, required this.predicate});
}
