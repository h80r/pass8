import 'package:pass8/modes.dart';
import 'package:pass8/pass8.dart';

void main(List<String> arguments) {
  final wordbase = generateWordbase([
    // 'UFT',
    // 'Segurança e Auditoria de Sistemas',
    // '2022',
    'Ciência da Computação'
  ], 8, Modes.mixed);

  print(wordbase);
  print(wordbase.length);
}
