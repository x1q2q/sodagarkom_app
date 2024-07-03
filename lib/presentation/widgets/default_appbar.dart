import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'btn_circle.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const DefaultAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 58,
      backgroundColor: AppColors.purplev1,
      elevation: 0.4,
      title: Text(title, style: AppStyles.labelNavbar),
      leadingWidth: 55,
      leading: BtnCircle(
        bgColor: Colors.transparent,
        size: 35,
        widget: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58);
}
