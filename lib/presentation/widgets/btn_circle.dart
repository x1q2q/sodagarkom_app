import 'package:flutter/material.dart';

class BtnCircle extends StatelessWidget {
  final Widget widget;
  final void Function()? onTap;
  final Color bgColor;
  final Color? splashColor;
  final double size;
  final double padding;
  const BtnCircle(
      {Key? key,
      required this.widget,
      this.onTap,
      required this.bgColor,
      this.splashColor,
      required this.size,
      this.padding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Material(
        color: bgColor,
        shape: const CircleBorder(),
        child: InkWell(
          splashColor: splashColor,
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Ink(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(shape: BoxShape.circle),
            height: size,
            width: size,
            child: widget,
          ),
        ),
      ),
    );
  }
}
