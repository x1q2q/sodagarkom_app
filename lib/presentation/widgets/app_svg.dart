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

  static Widget cart = SvgPicture.asset(Assets.iconCart);
  static Widget search = SvgPicture.asset(Assets.iconSearch);
  static Widget cartAdd = SvgPicture.asset(Assets.iconCartAdd);
  static Widget gridView = SvgPicture.asset(Assets.iconGridView);
  static Widget listView = SvgPicture.asset(Assets.iconListView);
}
