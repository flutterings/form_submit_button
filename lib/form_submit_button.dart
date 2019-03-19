library form_submit_button;

import 'package:flutter/material.dart';

typedef SubmitCallback = void Function(FormState currentState);

enum FormSubmitButtonType { raised, flat, outline }

/// A stateful Button for stateless Forms.
///
/// It can be used in a stateless form in order to use the [FormState]
/// for validation and saving, without the need of a [Key].
class FormSubmitButton extends StatelessWidget {
  /// It will be passed along to [MaterialButton.onPressed].
  final SubmitCallback submit;

  /// The type of the [MaterialButton] to be used.
  final FormSubmitButtonType type;

  /// It will be passed along to [MaterialButton.child].
  final Widget child;

  const FormSubmitButton(
      {Key key,
      @required this.submit,
      @required this.type,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wrappedCallback = () {
      final currentState = Form.of(context);
      this.submit(currentState);
    };

    switch (this.type) {
      case FormSubmitButtonType.flat:
        return _buildFlatButton(context, wrappedCallback);
      case FormSubmitButtonType.outline:
        return _buildOutlineButton(context, wrappedCallback);
      default:
        return _buildRaisedButton(context, wrappedCallback);
    }
  }

  RaisedButton _buildRaisedButton(
      BuildContext context, VoidCallback onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      child: this.child,
    );
  }

  FlatButton _buildFlatButton(BuildContext context, VoidCallback onPressed) {
    return FlatButton(
      onPressed: onPressed,
      child: this.child,
    );
  }

  OutlineButton _buildOutlineButton(
      BuildContext context, VoidCallback onPressed) {
    return OutlineButton(
      onPressed: onPressed,
      child: this.child,
    );
  }
}
