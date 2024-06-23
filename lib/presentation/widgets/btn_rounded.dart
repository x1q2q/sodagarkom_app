import 'package:flutter/material.dart';

class BtnRounded extends StatelessWidget {
  final Widget widget;
  final void Function()? onTap;
  final Color bgColor;
  final Color? splashColor;
  const BtnRounded(
      {Key? key,
      required this.widget,
      this.onTap,
      required this.bgColor,
      this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: splashColor,
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 35,
            width: 35,
            child: widget,
          ),
        ),
      ),
    );
  }
}
