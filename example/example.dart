import 'package:flutter/material.dart';
import 'package:form_submit_button/form_submit_button.dart';

typedef FormSubmittedCallback = void Function(Map<String, String>);

class FormPresentation extends StatelessWidget {
  final Map<String, String> values = const {};

  /// Input
  final String initialValue;

  /// Output
  final FormSubmittedCallback formSubmitted;

  const FormPresentation({Key key, this.initialValue, this.formSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Field1'),
            onSaved: (value) => values['Field1'] = value,
            initialValue: this.initialValue,
          ),
          FormSubmitButton(
            child: Text('submit'),
            submit: (FormState state) {
              if (state.validate()) {
                state.save();
                this.formSubmitted(this.values);
              }
            },
          ),
        ],
      ),
    );
  }
}

class FormContainer extends StatefulWidget {
  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  @override
  Widget build(BuildContext context) {
    return FormPresentation(
      initialValue: 'value',
      formSubmitted: (Map<String, String> values) {
        //Probably serialize it to your model here and use a BLoC to save it
      },
    );
  }
}

main() {
  runApp(MaterialApp(
    title: 'FormSubmitButton Example',
    home: Scaffold(
      body: FormContainer(),
    ),
  ));
}
