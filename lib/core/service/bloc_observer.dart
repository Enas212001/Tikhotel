import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBLocObserver implements BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log('event $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('error $error');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('change $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('transition $transition ');
  }

  @override
  void onClose(BlocBase bloc) {
    log('close $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('create $bloc');
  }
}
