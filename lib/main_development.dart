import 'package:codeunion/app/app.dart';
import 'package:codeunion/bootstrap.dart';
import 'package:equatable/equatable.dart';

void main() {
  EquatableConfig.stringify = true;
  print(const String.fromEnvironment('HOST_URL'));
  bootstrap(() => const App());
}
