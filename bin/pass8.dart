import 'package:pass8/modes.dart';
import 'package:pass8/pass8.dart';

void main(List<String> arguments) {
  final wordbase = generateWordbase([
    'UFT',
    'Segurança e Auditoria de Sistemas',
    '2022',
    'Ciência da Computação'
  ], passwordLength: 8, mode: Modes.mixed);

  print(wordbase);
  print(wordbase.length);

  final passwords = generatePasswords(
    wordbase,
    passwordLength: 8,
    passwordCount: 3000,
    fillingMode: Modes.mixed,
  );

  print(passwords);
  print(passwords.length);
}
