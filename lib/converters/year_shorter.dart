List<String> yearShorter(String input) {
  final result = [input];
  if (input.length != 4) return result;

  final number = int.tryParse(input);
  if (number == null) return result;
  if (number < 1000 || number > 3000) return result;

  return [...result, input.substring(2)];
}
