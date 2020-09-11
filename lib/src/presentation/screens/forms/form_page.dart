import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  static const String routeName = "form_page";
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forms"),
      ),
      body: Column(
        children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          Row(
            children: [
              Radio(
                value: 1,
                onChanged: (val) {},
                groupValue: 0,
              ),
              Radio(
                value: 2,
                onChanged: (val) {},
                groupValue: 2,
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                onChanged: (val) {},
                value: true,
              ),
              Checkbox(
                onChanged: (val) {},
                value: false,
              ),
            ],
          ),
          RaisedButton(
            onPressed: (){},
            child: Text('guardar'),
          )
        ],
      ),
    );
  }
}
