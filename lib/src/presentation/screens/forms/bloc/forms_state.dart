part of 'forms_bloc.dart';

class FormScreenState extends Equatable {
  final String name;
  final String description;
  final int radio;
  final bool checkbox;
  final String errorName;
  final String errorDescription;

  final RequestType requestType;

  FormScreenState({this.name, this.description, this.radio = 1, this.checkbox = false, this.errorName = '', this.errorDescription = '', this.requestType});


  FormScreenState copyWith({ String name, String description, int radio, bool checkbox, String errorName, String errorDescription, RequestType requestType }) {
    return FormScreenState(
      name: name ?? this.name,
      description: description ?? this.description,
      radio: radio ?? this.radio,
      checkbox: checkbox ?? this.checkbox,
      errorName: errorName ?? this.errorName,
      errorDescription: errorDescription ?? this.errorDescription,
      requestType: requestType ?? this.requestType,
    );
  }

  @override
  List<Object> get props => [name, description, radio, checkbox, errorName, errorDescription, requestType];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> obj = {
    "name": this.name,
    "description": this.description,
    "radio": this.radio,
    "checkbox": this.checkbox
    };

    return obj;
  }
 }