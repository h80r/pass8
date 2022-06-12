import 'package:pass8/converters/capsify.dart';
import 'package:pass8/converters/leetify.dart';
import 'package:pass8/converters/shortify.dart';

void main(List<String> arguments) {
  print(capsify('Heitor'));
  print(leetify('Heitor'));
  print(shortify('2000'));
  print(shortify('Segurança e Auditoria de Sistemas'));
}
