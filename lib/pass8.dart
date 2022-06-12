import 'package:pass8/converters/capsify.dart';
import 'package:pass8/converters/leetify.dart';
import 'package:pass8/converters/shortify.dart';
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
