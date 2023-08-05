import 'package:codeunion/app/app.dart';
import 'package:codeunion/bootstrap.dart';
import 'package:equatable/equatable.dart';

void main() {
  EquatableConfig.stringify = true;
  bootstrap(() => const App());
}
