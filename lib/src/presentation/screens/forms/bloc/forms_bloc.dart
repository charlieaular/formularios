import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forms_event.dart';
part 'forms_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc(FormState initialState) : super(initialState);

  @override
  Stream<FormState> mapEventToState(FormEvent event) {

    throw UnimplementedError();
  }

}