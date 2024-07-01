import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/styles.dart';

class AppInputField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon? icon;
  final int lines;
  final Color bgColor;
  final TextInputType? type;
  AppInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.icon,
      this.bgColor = Colors.white,
      this.lines = 1,
      this.type});

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool _isHidden = true;
  void togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    // use the ternary instead of object properties cause obscureText cant accept maxLines attribute
    return (widget.lines > 1)
        ? TextField(
            maxLines: widget.lines,
            controller: widget.controller,
            cursorColor: AppColors.blackv1,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hoverColor: AppColors.lightgray,
              fillColor: widget.bgColor,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
              hintStyle: AppStyles.fieldInput,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.grayv1),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.blackv2)),
              filled: true,
            ))
        : TextField(
            keyboardType: widget.type,
            controller: widget.controller,
            obscureText: widget.obscureText ? _isHidden : widget.obscureText,
            cursorColor: AppColors.blackv1,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hoverColor: AppColors.lightgray,
              fillColor: widget.bgColor,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
              hintStyle: AppStyles.fieldInput,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.grayv1),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.blackv2)),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.grayv1,
                      ),
                      onPressed: togglePasswordView,
                    )
                  : widget.icon,
              suffixIconColor: AppColors.grayv1,
              filled: true,
            ));
  }
}
