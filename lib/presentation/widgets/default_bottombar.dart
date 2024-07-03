import 'package:flutter/material.dart';
import '../../core/colors.dart';

class DefaultBottombar extends StatelessWidget {
  final Widget widget;
  const DefaultBottombar({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: AppColors.lightred,
            child: widget));
  }
}
