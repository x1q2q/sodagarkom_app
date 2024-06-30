import 'package:flutter/material.dart';

class BtnRounded extends StatelessWidget {
  final Widget widget;
  final void Function()? onTap;
  final Color bgColor;
  final Color? splashColor;
  final bool isOutline;
  final double size;
  const BtnRounded(
      {Key? key,
      required this.widget,
      this.onTap,
      required this.bgColor,
      this.splashColor,
      this.isOutline = false,
      this.size = 35})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: !isOutline ? bgColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: splashColor,
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            padding: const EdgeInsets.all(8),
            decoration: !isOutline
                ? BoxDecoration(borderRadius: BorderRadius.circular(10))
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: bgColor, width: 1.5)),
            height: size,
            width: size,
            child: widget,
          ),
        ),
      ),
    );
  }
}
