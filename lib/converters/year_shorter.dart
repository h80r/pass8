List<String> yearShorter(String input) {
  if (input.length != 4) return [];

  final number = int.tryParse(input);
  if (number == null) return [];
  if (number < 1000 || number > 3000) return [];

  return [input.substring(2)];
}
