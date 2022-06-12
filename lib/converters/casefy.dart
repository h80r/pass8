import 'dart:math';

import 'package:pass8/modes.dart';

final _rand = Random();

List<String> casefy(String input, [Modes mode = Modes.shallow]) {
  switch (mode) {
    case Modes.shallow:
      return _shallow(input);
    case Modes.random:
      return _random(input);
    case Modes.mixed:
      return _mixed(input);
    case Modes.deep:
      return _deep(input);
  }
}

List<String> _shallow(String input) {
  return [input, input.toUpperCase()];
}

List<String> _random(String input) {
  return [
    input,
    input
        .split('')
        .map((c) => _rand.nextDouble() < 0.5 ? c : c.toUpperCase())
        .join()
  ];
}

List<String> _mixed(String input) {
  return _shallow(input)
    ..addAll(_random(input))
    ..toList();
}

List<String> _deep(String input, [String currentString = '']) {
  if (input.isEmpty) return [currentString];

  final char = input.substring(0, 1);
  if (char == ' ') {
    return [
      ..._deep(input.substring(1), currentString + char),
    ];
  }

  print(currentString);

  return [
    ..._deep(input.substring(1), currentString + char),
    ..._deep(input.substring(1), currentString + char.toUpperCase()),
  ];
}
