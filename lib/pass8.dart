import 'package:pass8/converters/acronify.dart';
import 'package:pass8/converters/casefy.dart';
import 'package:pass8/converters/leetify.dart';
import 'package:pass8/generators/length_inator.dart';
import 'package:pass8/generators/trim_inator.dart';
import 'package:pass8/modes.dart';
import 'package:trotter/trotter.dart';

extension on List<String> {
  List<String> flatMap(List<String> Function(String) f) {
    return map(f).expand((l) => l).toSet().toList();
  }
}

List<String> generateWordbase(
  List<String> input, {
  int? passwordLength = 8,
  Modes mode = Modes.shallow,
}) {
  print('Preparando lista de palavras...');
  final wordlist = input.map((e) => e.toLowerCase()).toSet().toList();

  print('Transformando em acrônimos...');
  final acronym = wordlist.flatMap(acronify);

  print('Leetificando...');
  final leetSpeak = acronym.flatMap((w) => leetify(w, mode));

  print('Minificando...');
  final randomCase = leetSpeak.flatMap((w) => casefy(w, mode));

  print('Retirando espaços...');
  final trimmed = trimInator(randomCase)..shuffle();

  if (passwordLength != null) {
    print('Preenchendo senhas...');
    final passwords = lengthInator(trimmed, passwordLength, mode)..shuffle();
    return {...trimmed, ...passwords}.toList()..shuffle();
  }

  return trimmed;
}

List<String> generatePasswords(
  List<String> wordbase, {
  int? passwordLength = 8,
  int passwordCount = 3000,
  Modes fillingMode = Modes.shallow,
}) {
  final result = {...wordbase.where((w) => w.length >= (passwordLength ?? 0))};
  final compounds = Compounds(wordbase);

  var i = 0;
  while (result.length < passwordCount) {
    final word = compounds[i++].join();
    if (word.length >= (passwordLength ?? 0)) {
      result.add(word);
      continue;
    }

    result.addAll(lengthInator([word], passwordLength!, fillingMode));
  }

  return result.toList();
}
