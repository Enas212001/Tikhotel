String refactorDateWithTime(String? dateStr) {
  if (dateStr == null || dateStr == 'N/A') return 'N/A';
  final dateTime = DateTime.tryParse(dateStr);
  if (dateTime == null) return dateStr;
  return '${dateTime.year.toString().padLeft(4, '0')}-'
      '${dateTime.month.toString().padLeft(2, '0')}-'
      '${dateTime.day.toString().padLeft(2, '0')}, '
      '${dateTime.hour.toString().padLeft(2, '0')}:'
      '${dateTime.minute.toString().padLeft(2, '0')}';
}

String refactorDate(String? dateStr) {
  if (dateStr == null || dateStr == 'N/A') return 'N/A';
  final dateTime = DateTime.tryParse(dateStr);
  if (dateTime == null) return dateStr;
  return '${dateTime.year.toString().padLeft(4, '0')}-'
      '${dateTime.month.toString().padLeft(2, '0')}-'
      '${dateTime.day.toString().padLeft(2, '0')}';
}
