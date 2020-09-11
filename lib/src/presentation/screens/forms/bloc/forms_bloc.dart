import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formularios/src/core/models/enum_vars.dart';
import 'package:formularios/src/presentation/screens/forms/repository/forms_repository.dart';
import 'package:meta/meta.dart';

part 'forms_event.dart';
part 'forms_state.dart';

class FormBloc extends Bloc<FormEvent, FormScreenState> {
  FormsRepository _formsRepository;
  FormBloc({@required FormsRepository formsRepository}) :
    assert(formsRepository != null),
    _formsRepository = formsRepository,
    super(FormScreenState());


  @override
  Stream<FormScreenState> mapEventToState(FormEvent event) async* {
    switch (event.runtimeType) {
      case NameChanged:
        yield* _mapNameChangedToState(event);
        break;



      case DescriptionChanged:
        yield* _mapDescriptionChangedToState(event);
        break;

      case RadioChanged:
        yield* _mapRadioChangedToState(event);
        break;

      case CheckboxChanged:
        yield* _mapCheckboxChangedToState(event);
        break;

      case Submitted:
        yield* _mapSubmittedToState(event);
        break;
    }

  }

  Stream<FormScreenState> _mapNameChangedToState(NameChanged event) async* {
    var error = '';
    if (event.data.isEmpty) {
      error = 'No puede ser vacio';
    }
    yield state.copyWith(
      name: event.data,
      errorName: error
    );
  }

  Stream<FormScreenState> _mapDescriptionChangedToState(DescriptionChanged event) async * {
    var error = '';
    if (event.data.isEmpty) {
      error = 'No puede ser vacio';

    }
    yield state.copyWith(
      description: event.data,
      errorDescription: error
    );
  }

  Stream<FormScreenState> _mapRadioChangedToState(RadioChanged event) async * {
    yield state.copyWith(
        radio: event.data,
    );
  }

  Stream<FormScreenState> _mapCheckboxChangedToState(CheckboxChanged event) async * {
    yield state.copyWith(
      checkbox: event.data,
    );
  }

  Stream<FormScreenState> _mapSubmittedToState(Submitted event) async * {
    try {
      yield state.copyWith(
          requestType: RequestType.SENDING
      );
      Map<String, dynamic> obj = {
        "name": state.name,
        "description": state.description,
        "radio": state.radio,
        "checkbox": state.checkbox
      };

      await _formsRepository.saveApi(obj);


      print(jsonEncode(state.toJson()));

      yield state.copyWith(
          requestType: RequestType.CREATED_SUCCESS
      );
    } catch (err) {
      yield state.copyWith(
          requestType: RequestType.ERROR_HTTP
      );
      print(err);
    }


  }





}