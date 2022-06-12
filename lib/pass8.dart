import 'package:pass8/converters/acronify.dart';
import 'package:pass8/converters/casefy.dart';
import 'package:pass8/converters/leetify.dart';
import 'package:pass8/generators/length_inator.dart';
import 'package:pass8/generators/trim_inator.dart';
import 'package:pass8/modes.dart';

extension on List<String> {
  List<String> flatMap(List<String> Function(String) f) {
    return map(f).expand((l) => l).toSet().toList();
  }
}

List<String> generateWordbase(
  List<String> input, [
  int length = 8,
  Modes mode = Modes.shallow,
]) {
  print('Preparando lista de palavras...');
  final wordlist = input.map((e) => e.toLowerCase()).toSet().toList();

  print('Transformando em acrônimos...');
  final acronym = wordlist.flatMap(acronify);

  print('Leetificando...');
  final leetSpeak = acronym.flatMap((w) => leetify(w, mode));

  print('Minificando...');
  final randomCase = leetSpeak.flatMap((w) => casefy(w, mode));

  print('Retirando espaços...');
  final trimmed = trimInator(randomCase);

  print('Preenchendo senhas...');
  final passwords = lengthInator(trimmed, length, mode);

  return passwords;
}
