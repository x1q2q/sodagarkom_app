import 'package:flutter/material.dart';

class RowLabel extends StatelessWidget {
  final String field;
  final String value;
  final TextStyle fieldKeyStyle;
  final TextStyle? fieldValStyle;
  const RowLabel(
      {Key? key,
      required this.field,
      required this.value,
      required this.fieldKeyStyle,
      this.fieldValStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(field, style: fieldKeyStyle),
        Text(value, style: fieldValStyle ?? fieldKeyStyle)
      ],
    );
  }
}
