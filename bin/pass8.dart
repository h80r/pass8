import 'package:pass8/files.dart';
import 'package:pass8/pass8.dart';
import 'package:pass8/prompts.dart';

void main(List<String> arguments) {
  final wordlist = openWordlist();
  final passwordLength = requestPasswordLength();
  final executionMode = requestMode();
  final wordbase = generateWordbase(
    wordlist,
    passwordLength: passwordLength,
    mode: executionMode,
  );

  final passwordCount = requestPasswordCount();
  final passwords = generatePasswords(
    wordbase,
    passwordLength: passwordLength,
    passwordCount: passwordCount,
    fillingMode: executionMode,
  );

  saveWordlist(passwords);
}
