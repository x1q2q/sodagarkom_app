import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';

class AppSkeleton {
  static Widget baseContainer(double w, double h,
      {double radius = 10, int shadeGrey = 200}) {
    return Container(
        width: w,
        height: h,
        decoration: ShapeDecoration(
            color: Colors.grey[shadeGrey]!,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)))));
  }

  static Widget roundedContainer() {
    return SizedBox(
      width: 120,
      child: Container(
        height: 120,
        decoration: ShapeDecoration(
            color: Colors.grey[400]!, shape: const CircleBorder()),
      ),
    );
  }

  static Widget shimmerImg = Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade200,
      child: baseContainer(double.infinity, double.infinity));

  static Widget shimmerDetail = Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          baseContainer(310, 35, shadeGrey: 300),
          AppStyles.vSpaceSmall,
          Row(children: <Widget>[
            baseContainer(80, 29, shadeGrey: 300, radius: 30),
            const SizedBox(width: 10),
            baseContainer(80, 29, shadeGrey: 300, radius: 30),
          ]),
          AppStyles.vSpaceMedium,
          baseContainer(310, 20, shadeGrey: 300),
          AppStyles.vSpaceSmall,
          baseContainer(double.infinity, 20, shadeGrey: 300),
          AppStyles.vSpaceSmall,
          baseContainer(double.infinity, 20, shadeGrey: 300),
          AppStyles.vSpaceSmall,
          baseContainer(double.infinity, 20, shadeGrey: 300),
          AppStyles.vSpaceSmall
        ],
      ));

  static Widget shimmerPrice = Shimmer.fromColors(
      baseColor: Colors.red.shade200,
      highlightColor: Colors.red.shade300,
      child: baseContainer(190, 28));

  static Widget shimmerGridView = Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 20 / 23,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: 6,
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return baseContainer(double.infinity, 120, radius: 18);
          }));

  static Widget shimmerListView = Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: ListView.separated(
          itemCount: 6,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              AppStyles.vSpaceSmall,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return baseContainer(double.infinity, 100, radius: 18);
          }));
  static Widget shimmerImgSmall = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: baseContainer(120, 120));

  static Widget shimmerCategory = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: baseContainer(170, 25));

  static Widget shimmerDescription = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          baseContainer(180, 20, shadeGrey: 300),
          AppStyles.vSpaceSmall,
          baseContainer(double.infinity, 20, shadeGrey: 300),
          AppStyles.vSpaceSmall,
          baseContainer(double.infinity, 20, shadeGrey: 300),
          AppStyles.vSpaceSmall
        ],
      ));

  static Widget shimmerSpan = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: baseContainer(double.infinity, 20));

  static Widget shimmerTransaction = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppStyles.vSpaceXSmall,
          baseContainer(170, 20, shadeGrey: 300),
          AppStyles.vSpaceSmall,
          baseContainer(double.infinity, 20, shadeGrey: 300),
          AppStyles.vSpaceXSmall,
          baseContainer(double.infinity, 20, shadeGrey: 300),
          AppStyles.vSpaceXSmall
        ],
      ));

  static Widget shimmerTransactionTotal = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade400,
      child: ListView.separated(
          itemCount: 4,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              AppStyles.vSpaceSmall,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return baseContainer(double.infinity, 20, shadeGrey: 300);
          }));

  static Widget shimmerListProducTrx = Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: ListView.separated(
          itemCount: 2,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(color: AppColors.grayv1),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return baseContainer(double.infinity, 70, radius: 18);
          }));

  static Widget shimmerBtn = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: baseContainer(100, 26, radius: 18));

  static Widget shimmerBtnRed = Shimmer.fromColors(
      baseColor: Colors.red.shade200,
      highlightColor: Colors.red.shade300,
      child: baseContainer(120, 26));

  static Widget shimmerChips = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              baseContainer(100, 30, radius: 8),
              const SizedBox(width: 10),
              baseContainer(100, 30, radius: 8),
              const SizedBox(width: 10),
              baseContainer(100, 30, radius: 8),
              const SizedBox(width: 10)
            ],
          )));

  static Widget shimmerProfil = Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Column(
        children: <Widget>[
          AppStyles.vSpaceSmall,
          roundedContainer(),
          AppStyles.vSpaceSmall,
          baseContainer(160, 26, radius: 18)
        ],
      ));

  static Widget shimmerListProfile = Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListView.separated(
            itemCount: 6,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppStyles.vSpaceSmall,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) {
              return baseContainer(double.infinity, 30, shadeGrey: 300);
            }),
      ));

  static Widget shimmerEditProfil = Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Column(
        children: <Widget>[
          AppStyles.vSpaceSmall,
          roundedContainer(),
          AppStyles.vSpaceSmall,
        ],
      ));
}
