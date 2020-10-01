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

  /// It will be passed along to [MaterialButton.shape].
  final ShapeBorder shape;

  /// It will be passed along to [MaterialButton.textColor].
  final Color textColor;

  /// It will be passed along to [MaterialButton.disabledTextColor].
  final Color disabledTextColor;

  /// It will be passed along to [MaterialButton.color].
  final Color color;

  /// It will be passed along to [MaterialButton.disabledColor] except for
  /// when [FormSubmitButtonType.outline].
  final Color disabledColor;

  /// It will be passed along to [MaterialButton.focusColor].
  final Color focusColor;

  /// It will be passed along to [MaterialButton.hoverColor].
  final Color hoverColor;

  /// It will be passed along to [MaterialButton.highlightColor].
  final Color highlightColor;

  /// It will be passed along to [MaterialButton.splashColor].
  final Color splashColor;

  const FormSubmitButton(
      {Key key,
      @required this.submit,
      @required this.type,
      @required this.child,
      this.shape,
      this.textColor,
      this.disabledTextColor,
      this.color,
      this.disabledColor,
      this.focusColor,
      this.hoverColor,
      this.highlightColor,
      this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wrappedCallback = () {
      final currentState = Form.of(context);
      this.submit(currentState);
    };

    switch (this.type) {
      case FormSubmitButtonType.flat:
        return _buildFlatButton(context, wrappedCallback,
            shape: shape,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            color: color,
            disabledColor: disabledColor,
            focusColor: focusColor,
            hoverColor: hoverColor,
            highlightColor: highlightColor,
            splashColor: splashColor);
      case FormSubmitButtonType.outline:
        return _buildOutlineButton(context, wrappedCallback,
            shape: shape,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            color: color,
            focusColor: focusColor,
            hoverColor: hoverColor,
            highlightColor: highlightColor,
            splashColor: splashColor);
      default:
        return _buildRaisedButton(context, wrappedCallback,
            shape: shape,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            color: color,
            disabledColor: disabledColor,
            focusColor: focusColor,
            hoverColor: hoverColor,
            highlightColor: highlightColor,
            splashColor: splashColor);
    }
  }

  RaisedButton _buildRaisedButton(BuildContext context, VoidCallback onPressed,
      {ShapeBorder shape,
      Color textColor,
      Color disabledTextColor,
      Color color,
      Color disabledColor,
      Color focusColor,
      Color hoverColor,
      Color highlightColor,
      Color splashColor}) {
    return RaisedButton(
        onPressed: onPressed,
        child: this.child,
        shape: shape,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor);
  }

  FlatButton _buildFlatButton(BuildContext context, VoidCallback onPressed,
      {ShapeBorder shape,
      Color textColor,
      Color disabledTextColor,
      Color color,
      Color disabledColor,
      Color focusColor,
      Color hoverColor,
      Color highlightColor,
      Color splashColor}) {
    return FlatButton(
        onPressed: onPressed,
        child: this.child,
        shape: shape,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor);
  }

  OutlineButton _buildOutlineButton(
      BuildContext context, VoidCallback onPressed,
      {ShapeBorder shape,
      Color textColor,
      Color disabledTextColor,
      Color color,
      Color focusColor,
      Color hoverColor,
      Color highlightColor,
      Color splashColor}) {
    return OutlineButton(
        onPressed: onPressed,
        child: this.child,
        shape: shape,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor);
  }
}
