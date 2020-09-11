part of 'forms_bloc.dart';

abstract class FormEvent extends Equatable {

  FormEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends FormEvent {
  final String data;

  NameChanged({@required this.data});
}

class DescriptionChanged extends FormEvent {
  final String data;

  DescriptionChanged({@required this.data});
}

class RadioChanged extends FormEvent {
  final int data;

  RadioChanged({@required this.data});
}

class CheckboxChanged extends FormEvent {
  final bool data;

  CheckboxChanged({@required this.data});
}

class Submitted extends FormEvent {  }
