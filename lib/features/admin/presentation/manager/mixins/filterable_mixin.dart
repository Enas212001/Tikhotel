mixin FilterableMixin<T> {
  List<T> allItems = [];
  String currentFilter = 'all';
  String currentSearchQuery = '';

  /// Override this method in your cubit to define how to filter items
  bool filterItem(T item, String filter);

  /// Override this method in your cubit to define how to search items
  bool searchItem(T item, String query);

  /// Override this method in your cubit to emit the filtered state
  void emitFilteredState(List<T> filteredItems);

  void filterItems(String filter) {
    currentFilter = filter;
    _applyFilters();
  }

  void searchItems(String query) {
    currentSearchQuery = query;
    _applyFilters();
  }

  void resetFilters() {
    currentFilter = 'all';
    currentSearchQuery = '';
    _applyFilters();
  }

  void _applyFilters() {
    List<T> filtered = List.from(allItems);

    // Apply status filter
    if (currentFilter != 'all') {
      filtered = filtered.where((item) => filterItem(item, currentFilter)).toList();
    }

    // Apply search filter
    if (currentSearchQuery.isNotEmpty) {
      filtered = filtered.where((item) => searchItem(item, currentSearchQuery)).toList();
    }

    emitFilteredState(filtered);
  }

  /// Helper method to get common filter options for active/inactive items
  static List<String> getActiveInactiveFilters() {
    return ['all', 'active', 'inactive'];
  }

  /// Helper method to get filter labels
  static String getFilterLabel(String filter, String allLabel, String activeLabel, String inactiveLabel) {
    switch (filter) {
      case 'all':
        return allLabel;
      case 'active':
        return activeLabel;
      case 'inactive':
        return inactiveLabel;
      default:
        return filter;
    }
  }
}
