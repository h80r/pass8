import 'dart:io';

import 'package:interact/interact.dart';
import 'package:pass8/modes.dart';

Modes requestMode() {
  final willContinue = Confirm(
    prompt: 'A seguir, será necessário escolher um modo de execução.\n'
        'O modo de execução define a complexidade do algoritmo.\n'
        'O modo de execução "shallow" é o mais rápido, porém o mais simples.\n'
        '\tEle gera possibilidades trocando todas as vogais por números e\n'
        '\tlevando todas as letras para caixa alta, preenchendo com números\n'
        '\tem ordem crescente para alcançar o número de caracteres alvo.\n'
        'O modo de execução "random" é rápido e agrega aleatoriedade, porém gera poucas senhas\n'
        '\tEle gera possibilidades trocando algumas das vogais, escolhidas ao\n'
        '\tacaso, por números, e levando letras aleatórias para caixa alta,\n'
        '\tpreenchendo com números também randômicos.\n'
        'O modo de execução "mixed" une os resultados de "shallow" e "random"\n'
        '\tEste é o modo de execução recomendado, e o padrão.\n'
        'O modo de execução "deep" é mais lento, pois tenta gerar todas as possibilidades.\n'
        '\tEste modo gera todas as permutações de palavras possíveis, que podem\n'
        '\tter vogais trocadas por números, letras trocadas para caixa alta,\n'
        '\te preenchidos com todas as permutações de números.\n'
        'Você está pronto para continuar?',
    waitForNewLine: true,
    defaultValue: true,
  ).interact();

  if (!willContinue) {
    exit(0);
  }

  final mode = Select(
    prompt: 'Escolha o modo de preenchimento:',
    options: [for (final m in Modes.values) m.toString().split('.').last],
    initialIndex: 3,
  ).interact();

  return Modes.values[mode];
}

int? requestPasswordLength() {
  final number = Input(
    prompt: 'Digite o número de caracteres mínimo que'
        ' você deseja para suas senhas (-1 para ignorar mínimo):',
    defaultValue: '8',
    validator: (value) {
      final parsed = int.tryParse(value);
      if (parsed == null) {
        throw ValidationError('Número inválido');
      }
      if (parsed == -1) {
        return true;
      }
      if (parsed < 1) {
        throw ValidationError('É necessário um número maior ou igual a 1');
      }
      return true;
    },
  ).interact();

  final parsed = int.parse(number);
  if (parsed == -1) {
    return null;
  }
  return parsed;
}

int requestPasswordCount() {
  final number = Input(
    prompt: 'Digite o número de senhas que você deseja gerar:',
    defaultValue: '3000',
    validator: (value) {
      final parsed = int.tryParse(value);
      if (parsed == null) {
        throw ValidationError('Número inválido');
      }
      if (parsed < 100) {
        throw ValidationError('É necessário um número maior ou igual a 1');
      }
      return true;
    },
  ).interact();

  return int.parse(number);
}
