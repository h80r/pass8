bool _isYear(String str) =>
    str.length == 4 && str.split('').every((c) => int.tryParse(c) != null);

List<String> shortify(String input) {
  if (_isYear(input)) return _year(input);
  return _shortify(input);
}

List<String> _year(String input) => [input, input.substring(2)];

final _particles = [
  'e',
  'o',
  'a',
  'os',
  'as',
  'de',
  'do',
  'da',
  'dos',
  'das',
  'para',
];

List<String> _shortify(String input) {
  final words = input.toLowerCase().split(' ')
    ..removeWhere((p) => _particles.contains(p));

  if (words.length == 1) return [input];
  return [input, words.map((e) => e.substring(0, 1)).join()];
}
