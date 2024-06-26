import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/styles.dart';

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
      baseColor: Colors.pink.shade200,
      highlightColor: Colors.pink.shade300,
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
          physics: NeverScrollableScrollPhysics(),
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return baseContainer(double.infinity, 100, radius: 18);
          }));

  static Widget shimmerProfil = Shimmer.fromColors(
      baseColor: Colors.lightGreen.shade200,
      highlightColor: Colors.lightGreen.shade100,
      child: Column(
        children: <Widget>[
          AppStyles.vSpaceXSmall,
          SizedBox(
            width: 120,
            child: Container(
              height: 120,
              decoration: ShapeDecoration(
                  color: Colors.grey[400]!, shape: const CircleBorder()),
            ),
          ),
          AppStyles.vSpaceMedium,
          Container(
            width: 140,
            height: 26,
            decoration: ShapeDecoration(
                color: Colors.grey[400]!,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
          ),
          AppStyles.vSpaceLarge,
          AppStyles.vSpaceSmall,
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: ShapeDecoration(
                          color: Colors.grey[400]!,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    );
                  }))
        ],
      ));
  static Widget shimmerNotif = Shimmer.fromColors(
      baseColor: Colors.lightGreen.shade200,
      highlightColor: Colors.lightGreen.shade100,
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppStyles.vSpaceXSmall,
              Container(
                height: 30,
                width: 190,
                decoration: ShapeDecoration(
                    color: Colors.grey[400]!,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)))),
              ),
              AppStyles.vSpaceXSmall,
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              width: 60,
                              child: Container(
                                height: 60,
                                decoration: ShapeDecoration(
                                    color: Colors.grey[400]!,
                                    shape: const CircleBorder()),
                              )),
                          SizedBox(width: 10),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 20,
                                decoration: ShapeDecoration(
                                    color: Colors.grey[400]!,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)))),
                              ),
                              AppStyles.vSpaceXSmall,
                              Container(
                                height: 15,
                                decoration: ShapeDecoration(
                                    color: Colors.grey[400]!,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)))),
                              ),
                            ],
                          )),
                        ],
                      ));
                },
              ),
            ],
          )));
}
