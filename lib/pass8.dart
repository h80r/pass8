import 'package:interact/interact.dart';
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
  final wordlistSpinner = Spinner(
    icon: '📋',
    rightPrompt: (done) => done
        ? 'Lista de palavras padronizada!'
        : 'Padronizando lista de palavras...',
  ).interact();
  final wordlist = input.map((e) => e.toLowerCase()).toSet().toList();
  wordlistSpinner.done();

  final acronymSpinner = Spinner(
    icon: '🔠',
    rightPrompt: (done) => done
        ? 'Lista de acrônimos gerada!'
        : 'Gerando acrônimos para a lista de palavras...',
  ).interact();
  final acronym = wordlist.flatMap(acronify);
  acronymSpinner.done();

  final leetSpinner = Spinner(
    icon: '🤖',
    rightPrompt: (done) => done
        ? 'Tradução para L44T SP34K concluída!'
        : 'Traduzindo para L44T SP34K...',
  ).interact();
  final leetSpeak = acronym.flatMap((w) => leetify(w, mode));
  leetSpinner.done();

  final caseSpinner = Spinner(
    icon: '🔤',
    rightPrompt: (done) => done
        ? 'Lista de palavras com case convertida!'
        : 'Convertendo lista de palavras para case aleatório...',
  ).interact();
  final randomCase = leetSpeak.flatMap((w) => casefy(w, mode));
  caseSpinner.done();

  final trimSpinner = Spinner(
    icon: '🔪',
    rightPrompt: (done) => done
        ? 'Espaços devidamente removidos!'
        : 'Removendo espaços entre as palavras...',
  ).interact();
  final trimmed = trimInator(randomCase)..shuffle();
  trimSpinner.done();

  if (passwordLength != null) {
    final lengthSpinner = Spinner(
      icon: '🏗',
      rightPrompt: (done) => done
          ? ' Lista de palavras com tamanho padronizado!'
          : ' Preenchendo palavras curtas demais...',
    ).interact();
    final passwords = lengthInator(trimmed, passwordLength, mode)..shuffle();
    lengthSpinner.done();
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
  final passwordSpinner = Spinner(
    icon: '🗝',
    rightPrompt: (done) =>
        done ? ' Senhas geradas!' : ' Gerando permutações de senhas...',
  ).interact();

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

  passwordSpinner.done();
  return result.toList();
}
