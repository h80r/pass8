final _map = {
  'a': '4',
  'e': '3',
  'i': '1',
  'o': '0',
  's': '5',
  't': '7',
};

bool _isLeetable(String str) => _map.containsKey(str.toLowerCase());

List<String> leetify(String input) => _leetify(input);

List<String> _leetify(String input, [String currentString = '']) {
  if (input.isEmpty) return [currentString];

  final char = input.substring(0, 1);
  return [
    ..._leetify(input.substring(1), currentString + char),
    if (_isLeetable(char))
      ..._leetify(
        input.substring(1),
        currentString + _map[char]!,
      )
  ];
}
