import 'package:flutter/material.dart';

Widget newCourseFormField() {
  final _formKey = GlobalKey<FormState>();

  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter your grade',
          ),
          validator: (value) {
            if (value != "A" || value != "B") {
              return 'Please enter either "A" or "B"';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState.validate()) {
                // Process data.
                // writeCourseData
              }
            },
            child: Text('Submit'),
          ),
        ),
      ],
    ),
  );
}

