import 'package:flutter/material.dart';

class BtnCart extends StatelessWidget {
  final Widget svg;
  final void Function()? onTap;
  final Color bgColor;
  final Color splashColor;
  const BtnCart(
      {Key? key,
      required this.svg,
      this.onTap,
      required this.bgColor,
      required this.splashColor})
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
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            height: 50,
            width: 50,
            child: svg,
          ),
        ),
      ),
    );
  }
}
