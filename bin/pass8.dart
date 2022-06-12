import 'package:pass8/modes.dart';
import 'package:pass8/pass8.dart';

void main(List<String> arguments) {
  final wordbase = generateWordbase([
    'UFT',
    'Segurança e Auditoria de Sistemas',
    '2022',
    'Ciência da Computação'
  ], Modes.mixed);

  final trimmed = trimSpaces(wordbase);

  print(minimumLength(trimmed, 8, Modes.mixed));
}
