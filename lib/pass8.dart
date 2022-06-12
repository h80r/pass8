import 'package:pass8/converters/capsify.dart';
import 'package:pass8/converters/leetify.dart';
import 'package:pass8/converters/shortify.dart';
import 'package:pass8/generators/length_inator.dart';
import 'package:pass8/modes.dart';

extension on List<String> {
  List<String> flatMap(List<String> Function(String) f) {
    return map(f).expand((l) => l).toSet().toList();
  }
}

List<String> generateWordbase(
  List<String> input, [
  Modes mode = Modes.shallow,
]) {
  print('Preparing wordbase...');
  final words = input.map((e) => e.toLowerCase()).toSet().toList();

  print('Shortifying words...');
  final shortened = words.flatMap(shortify);

  print('Leetifying words...');
  final leetyfied = shortened.flatMap((w) => leetify(w, mode));

  print('Capsifying words...');
  final capsyfied = leetyfied.flatMap((w) => capsify(w, mode));

  return capsyfied;
}

List<String> trimSpaces(List<String> input) {
  return {
    ...input,
    ...input.map((w) => w.splitMapJoin(' ', onMatch: (m) => ''))
  }.toList();
}

List<String> minimumLength(
  List<String> input, [
  int minLength = 8,
  Modes mode = Modes.shallow,
]) {
  return input.expand((element) {
    if (element.length >= minLength) return [element];
    return lengthInator(element, minLength, mode);
  }).toList();
}
