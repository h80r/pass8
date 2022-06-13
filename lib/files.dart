import 'dart:io';

import 'package:interact/interact.dart';

List<String> openWordlist() {
  final loading = Spinner(
    icon: '📦',
    rightPrompt: (done) {
      return done
          ? 'Lista de palavras aberta!'
          : 'Abrindo lista de palavras...';
    },
  ).interact();

  try {
    final wordlist = File('input.txt').readAsLinesSync();
    loading.done();
    return wordlist;
  } on FileSystemException catch (_) {
    print('Não foi possível abrir a lista de palavras.');
    print('Insira suas palavras ou frases, uma por linha,'
        ' em um arquivo chamado "input.txt", dentro do diretório do programa.');
    exit(1);
  }
}

void saveWordlist(List<String> wordlist) {
  final saving = Spinner(
    icon: '📦',
    rightPrompt: (done) {
      return done
          ? 'Lista de palavras salva!'
          : 'Salvando lista de palavras...';
    },
  ).interact();

  try {
    File('output.txt').writeAsStringSync(wordlist.join('\n'));
    saving.done();
  } on FileSystemException catch (_) {
    print('Não foi possível salvar a lista de palavras.');
  }
}
