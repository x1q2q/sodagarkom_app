import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/assets.dart';

class AppSvg {
  static Widget homeTabs = SvgPicture.asset(Assets.tabsIconHome);
  static Widget homeActiveTabs = SvgPicture.asset(Assets.tabsIconHomeActive);

  static Widget productsTabs = SvgPicture.asset(Assets.tabsIconProducts);
  static Widget productsActiveTabs =
      SvgPicture.asset(Assets.tabsIconProductsActive);

  static Widget transactionsTabs =
      SvgPicture.asset(Assets.tabsIconTransactions);
  static Widget transactionsActiveTabs =
      SvgPicture.asset(Assets.tabsIconTransactionsActive);

  static Widget profileTabs = SvgPicture.asset(Assets.tabsIconProfile);
  static Widget profileActiveTabs =
      SvgPicture.asset(Assets.tabsIconProfileActive);
}
