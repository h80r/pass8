import 'package:pass8/converters/capsify.dart';
import 'package:pass8/converters/leetify.dart';
import 'package:pass8/converters/year_shorter.dart';

void main(List<String> arguments) {
  print(capsify('Heitor'));
  print(leetify('Heitor'));
  print(yearShorter('2000'));
}
