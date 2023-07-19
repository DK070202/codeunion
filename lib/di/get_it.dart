import 'package:codeunion/di/get_it.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: r'$setUpLocator',
  asExtension: false,
  preferRelativeImports: false,
)
final getIt = GetIt.I;

GetIt setUpLocator() => $setUpLocator(getIt);
