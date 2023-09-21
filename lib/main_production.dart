import 'package:codeunion/app/app.dart';
import 'package:codeunion/bootstrap.dart';
import 'package:codeunion/firebase_options_prod.dart';

Future<void> main() async {
  await bootstrap(
    () => const App(),
    DefaultFirebaseOptions.currentPlatform,
  );
}
