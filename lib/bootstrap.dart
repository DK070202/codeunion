import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:codeunion/di/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, [
  FirebaseOptions? firebaseOptions,
]) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (firebaseOptions != null) {
    try {
      await Firebase.initializeApp(
        options: firebaseOptions,
      );
    } catch (e) {
      log('Error occurred while initialing firebase app. error: $e');
    }
  }
  await FirebaseDynamicLinks.instance
      .getInitialLink()
      .then((value) => print(value?.link.toString() ?? ''));

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await setUpLocator();

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  runApp(await builder());
}
