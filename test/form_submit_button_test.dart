import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:form_submit_button/form_submit_button.dart';

class TestWidget extends StatelessWidget {
  final TextFormField textField;
  final FormSubmitButton submitButton;

  const TestWidget(
      {Key key, @required this.textField, @required this.submitButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          child: Column(
            children: <Widget>[
              textField,
              submitButton,
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('should use a RaisedButton with `submit` text',
      (WidgetTester tester) async {
    await tester.pumpWidget(TestWidget(
      textField: TextFormField(),
      submitButton: FormSubmitButton(
        type: FormSubmitButtonType.raised,
        child: Text('submit'),
      ),
    ));

    expect(find.byType(RaisedButton), findsOneWidget);
    expect(find.text('submit'), findsOneWidget);
  });

  testWidgets('should use a FlatButton with `submit` text',
      (WidgetTester tester) async {
    await tester.pumpWidget(TestWidget(
      textField: TextFormField(),
      submitButton: FormSubmitButton(
        type: FormSubmitButtonType.flat,
        child: Text('submit'),
      ),
    ));

    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.text('submit'), findsOneWidget);
  });

  testWidgets('should use an OutlineButton with `submit` text',
      (WidgetTester tester) async {
    await tester.pumpWidget(TestWidget(
      textField: TextFormField(),
      submitButton: FormSubmitButton(
        type: FormSubmitButtonType.outline,
        child: Text('submit'),
      ),
    ));

    expect(find.byType(OutlineButton), findsOneWidget);
    expect(find.text('submit'), findsOneWidget);
  });

  testWidgets('should default to RaisedButton, with `submit` text',
      (WidgetTester tester) async {
    await tester.pumpWidget(TestWidget(
      textField: TextFormField(),
      submitButton: FormSubmitButton(
        child: Text('submit'),
      ),
    ));

    expect(find.byType(RaisedButton), findsOneWidget);
    expect(find.text('submit'), findsOneWidget);
  });
}
