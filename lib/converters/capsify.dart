List<String> capsify(String input) => _capsify(input);

List<String> _capsify(String input, [String currentString = '']) {
  if (input.isEmpty) return [currentString];

  final char = input.substring(0, 1).toLowerCase();
  return [
    ..._capsify(input.substring(1), currentString + char),
    ..._capsify(input.substring(1), currentString + char.toUpperCase()),
  ];
}
