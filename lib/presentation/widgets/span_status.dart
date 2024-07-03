import 'package:flutter/material.dart';
import '../../core/colors.dart';

class SpanStatus extends StatelessWidget {
  final String text;
  final String tipe;
  const SpanStatus({super.key, required this.text, required this.tipe});
  Color bgColor() {
    switch (tipe) {
      case 'accepted':
        return AppColors.lightgreen;
      case 'pending':
        return AppColors.lightyellow;
      case 'reserved':
        return AppColors.lightpurple;
      case 'rejected':
        return AppColors.lightred;
      default:
        return Colors.black;
    }
  }

  Color txtColor() {
    switch (tipe) {
      case 'accepted':
        return AppColors.greenv1;
      case 'pending':
        return AppColors.yellowv1;
      case 'reserved':
        return AppColors.purplev1;
      case 'rejected':
        return AppColors.redv2;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: bgColor(),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'PlusJakarta',
              fontWeight: FontWeight.w700,
              color: txtColor(),
              fontSize: 14),
        ));
  }
}
