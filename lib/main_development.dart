import 'package:codeunion/app/app.dart';
import 'package:codeunion/bootstrap.dart';
import 'package:codeunion/firebase_options_dev.dart';
import 'package:equatable/equatable.dart';

Future<void> main() async {
  EquatableConfig.stringify = true;

  await bootstrap(
    () => const App(),
    DefaultFirebaseOptions.currentPlatform,
  );
}
