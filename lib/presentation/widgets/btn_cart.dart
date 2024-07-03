import 'package:flutter/material.dart';

class BtnCart extends StatelessWidget {
  final Widget svg;
  final void Function()? onTap;
  final Color bgColor;
  final Color splashColor;
  const BtnCart(
      {super.key,
      required this.svg,
      this.onTap,
      required this.bgColor,
      required this.splashColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: splashColor)),
            height: 58,
            width: 58,
            child: svg,
          ),
        ),
      ),
    );
  }
}
