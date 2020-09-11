import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formularios/src/core/models/enum_vars.dart';
import 'package:formularios/src/presentation/screens/forms/repository/forms_repository.dart';

import 'bloc/forms_bloc.dart';

class FormPage extends StatefulWidget {
  static const String routeName = "form_page";
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  int groupValue = 1;

  FormBloc _formBloc;
  @override
  void initState() {
    _formBloc = FormBloc(formsRepository: FormsRepository());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Forms"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<FormBloc, FormScreenState>(
                cubit: _formBloc,
                buildWhen: (previous, current) => previous.name != current.name,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (val) {
                      _formBloc.add(NameChanged(data: val));
                    },
                    autovalidate: true,
                    validator: (_) => state.errorName.isNotEmpty ? state.errorName : null,
                  );
                },
            ),
            BlocBuilder<FormBloc, FormScreenState>(
              cubit: _formBloc,
              buildWhen: (previous, current) => previous.description != current.description,
              builder: (context, state) {
                return TextFormField(
                  onChanged: (val){
                    _formBloc.add(DescriptionChanged(data: val));
                  },
                  autovalidate: true,
                  validator: (_) => state.errorDescription.isNotEmpty ? state.errorDescription : null,
                );
              },
            ),

            Row(
              children: [
                BlocBuilder<FormBloc, FormScreenState>(
                  cubit: _formBloc,
                  buildWhen: (previous, current) => previous.radio != current.radio,

                  builder: (context, state){
                    return Radio(
                      value: 1,
                      onChanged: (val) {
                        _formBloc.add(RadioChanged(data: val));
                      },
                      groupValue: state.radio,
                    );
                  },
                ),

                BlocBuilder<FormBloc, FormScreenState>(
                  cubit: _formBloc,
                  buildWhen: (previous, current) => previous.radio != current.radio,
                  builder: (context, state){
                    return Radio(
                      value: 2,
                      onChanged: (val) {
                        _formBloc.add(RadioChanged(data: val));
                      },
                      groupValue: state.radio,
                    );
                  },
                ),
              ],
            ),
            Row(
                //CheckboxChanged
              children: [
                BlocBuilder<FormBloc, FormScreenState>(
                  cubit: _formBloc,
                  buildWhen: (previous, current) => previous.checkbox != current.checkbox,
                  builder: (context, state) {
                    return Checkbox(
                      onChanged: (val) {
                        _formBloc.add(CheckboxChanged(data: val));
                      },
                      value: state.checkbox,
                    );
                  },
                ),

                Checkbox(
                  onChanged: (val) {},
                  value: false,
                ),
              ],
            ),
            BlocBuilder(
              cubit: _formBloc,
              builder: (context, FormScreenState state) {
                if (state.requestType == RequestType.SENDING) {
                  return CircularProgressIndicator();
                }
                return SizedBox();
              },
            ),
            RaisedButton(
              onPressed: (){
                _formBloc.add(Submitted());
              },
              child: Text('guardar'),
            )
          ],
        ),
      ),
    );
  }
}
