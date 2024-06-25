import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'span_status.dart';
import '../router/app_routes.dart';

enum MenuPopup { firstItem, secondItem, thirdItem }

class TransactionCard extends StatelessWidget {
  final String trxID;
  final String trxDate;
  final String status;
  final String productName;
  final String productQty;
  final String? trxQtyRemaining;
  final String totalAmount;
  final Widget productImage;
  final Widget? dialogUpload;
  final Widget? dialogCancel;
  final void Function() onTapCard;
  final controller;

  const TransactionCard(
      {Key? key,
      required this.trxID,
      required this.trxDate,
      required this.status,
      required this.productName,
      required this.productQty,
      this.trxQtyRemaining = '',
      required this.totalAmount,
      required this.productImage,
      this.dialogUpload,
      this.dialogCancel,
      required this.onTapCard,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productItemDesc = (trxQtyRemaining != '')
        ? '$productQty item (+$trxQtyRemaining lainnya)'
        : '$productQty item';

    return SizedBox.fromSize(
        child: Material(
            color: AppColors.lightgray,
            borderRadius: BorderRadius.circular(18),
            elevation: 0.1,
            child: InkWell(
                onTap: onTapCard,
                borderRadius: BorderRadius.circular(18),
                child: Container(
                    height: 155.0,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(trxID, style: AppStyles.trxCode),
                                    Text(trxDate, style: AppStyles.trxDate)
                                  ]),
                              SpanStatus(text: txtStatus(status), tipe: status)
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width: 80,
                                  height: 80,
                                  clipBehavior: Clip.antiAlias,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: AppColors.grayv1),
                                      borderRadius: BorderRadius.circular(18)),
                                  child: productImage),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          productName,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyles.trxProductName,
                                        ),
                                        Text(
                                          productItemDesc,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyles.trxProductDesc,
                                        ),
                                      ]),
                                  Text(
                                    'Total Belanja: $totalAmount',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.trxProductDesc,
                                  )
                                ],
                              )),
                              PopupMenuButton<MenuPopup>(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: AppColors.lightgray),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  color: Colors.white,
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: AppColors.blackv2,
                                    size: 40,
                                  ),
                                  onSelected: (MenuPopup item) {
                                    if (item.name == 'firstItem') {
                                      Get.dialog(dialogUpload!);
                                    } else if (item.name == 'secondItem') {
                                      String transactionId = '1';
                                      Get.toNamed(
                                          '${AppRoutes.transactionDetail.replaceFirst(":id", transactionId)}');
                                    } else if (item.name == 'thirdItem') {
                                      Get.dialog(dialogCancel!);
                                    }
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<MenuPopup>>[
                                        PopupMenuItem<MenuPopup>(
                                          value: MenuPopup.firstItem,
                                          enabled: dropDownItemUpload(status),
                                          child: Text('Upload Bukti Transfer',
                                              style: dropDownItemUpload(status)
                                                  ? AppStyles.txtDropdown
                                                  : AppStyles
                                                      .txtDropdownDisabled),
                                        ),
                                        PopupMenuItem<MenuPopup>(
                                          value: MenuPopup.secondItem,
                                          child: Text('Detail Transaksi',
                                              style: AppStyles.txtDropdown),
                                        ),
                                        PopupMenuItem<MenuPopup>(
                                          value: MenuPopup.thirdItem,
                                          enabled: dropDownItemCancel(status),
                                          child: Text('Batalkan Transaksi',
                                              style: dropDownItemCancel(status)
                                                  ? AppStyles.txtDropdown
                                                  : AppStyles
                                                      .txtDropdownDisabled),
                                        ),
                                      ]),
                            ])
                      ],
                    )))));
  }

  bool dropDownItemUpload(tipe) {
    return (tipe == 'reserved' || tipe == 'pending') ? true : false;
  }

  bool dropDownItemCancel(tipe) {
    return (tipe == 'reserved') ? true : false;
  }

  String txtStatus(tipe) {
    switch (tipe) {
      case 'accepted':
        return 'Selesai';
      case 'pending':
        return 'Pending';
      case 'reserved':
        return 'Perlu Upload';
      case 'cancelled':
        return 'Dibatalkan';
      default:
        return 'Unknown Status';
    }
  }
}
