import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:formularios/src/core/bloc/form_bloc_observer.dart';
import 'package:formularios/src/presentation/app.dart';

void main() {
  Bloc.observer = FormBlocObserver();
  runApp(App());
}
