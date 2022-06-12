import 'dart:math';

import 'package:pass8/modes.dart';

final rand = Random();

List<String> lengthInator(
  String input, [
  int length = 8,
  Modes mode = Modes.shallow,
]) {
  switch (mode) {
    case Modes.shallow:
      return _shallow(input, length);
    case Modes.random:
      return _random(input, length);
    case Modes.mixed:
      return _mixed(input, length);
    case Modes.deep:
      return _deep(input, length);
  }
}

List<String> _shallow(String input, int length) {
  return [input + List.generate(length - input.length, (i) => i + 1).join()];
}

List<String> _random(String input, int length) {
  return [
    input +
        List.generate(
          length - input.length,
          (_) => rand.nextInt(10),
        ).join()
  ];
}

List<String> _mixed(String input, int length) {
  return {..._shallow(input, length), ..._random(input, length)}.toList();
}

List<String> _deep(String input, int length) {
  if (input.length >= length) return [input];
  return [for (var i = 0; i <= 9; i++) ..._deep('$input$i', length)];
}
