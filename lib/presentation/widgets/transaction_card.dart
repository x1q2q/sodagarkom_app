import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'widgets.dart';
import '../router/app_routes.dart';
import '../../extensions/string_extensions.dart';

enum MenuPopupTransaction { firstItem, secondItem, thirdItem }

class TransactionCard extends StatelessWidget {
  final String trxID;
  final String trxCode;
  final String trxDate;
  final String status;
  final String productName;
  final String productQty;
  final String? trxQtyRemaining;
  final String totalAmount;
  final Widget productImage;
  final void Function() onTapCard;
  final controller;

  const TransactionCard(
      {Key? key,
      required this.trxID,
      required this.trxCode,
      required this.trxDate,
      required this.status,
      required this.productName,
      required this.productQty,
      this.trxQtyRemaining = '',
      required this.totalAmount,
      required this.productImage,
      required this.onTapCard,
      this.controller})
      : super(key: key);

  bool dropDownItemUpload(tipe) {
    return (tipe == 'reserved' || tipe == 'pending') ? true : false;
  }

  bool dropDownItemCancel(tipe) {
    return (tipe == 'reserved') ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    String productItemDesc = (trxQtyRemaining != '')
        ? '$productQty item (+$trxQtyRemaining produk lainnya)'
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
                    padding: const EdgeInsets.all(10),
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
                                    Text(trxCode, style: AppStyles.trxCode),
                                    Text(trxDate, style: AppStyles.trxDate)
                                  ]),
                              SpanStatus(
                                  text: status.txtStatusLabel(), tipe: status)
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width: 80,
                                  height: 80,
                                  clipBehavior: Clip.antiAlias,
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(right: 8),
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
                              popMenu(context)
                            ])
                      ],
                    )))));
  }

  Widget contentDialogUpload(BuildContext context) {
    String textContent =
        '''Pastikan anda sudah transfer sebesar: $totalAmount, ke salah satu nomor rekening berikut :
    - BRI (+62) 820000213291231, a.n Aleksander Grahambell
    - BCA (+46) 8394238022342, a.n Aleksander Grahambell.''';
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(textContent, style: AppStyles.dialogContent),
          AppStyles.vSpaceMedium,
          const Text('Jika sudah, upload bukti transfer di sini: ',
              style: AppStyles.dialogContent),
          AppStyles.vSpaceXSmall,
          Container(
            decoration: BoxDecoration(
                color: AppColors.lightgray,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BtnCircle(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AppSvg.galleryAdd,
                          const Text('Galeri', style: AppStyles.productNameTile)
                        ],
                      ),
                      bgColor: AppColors.lightgray,
                      size: 120,
                      padding: 15,
                      onTap: () {
                        controller.getImage('gallery');
                      }),
                  BtnCircle(
                      widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AppSvg.cameraAdd,
                            const Text('Kamera',
                                style: AppStyles.productNameTile)
                          ]),
                      bgColor: AppColors.lightgray,
                      size: 120,
                      padding: 15,
                      onTap: () {
                        controller.getImage('camera');
                      }),
                ]),
          )
        ]);
  }

  Widget dialogUpload(BuildContext context) {
    return AppDialogUpload(
        title: 'Pilih Bukti Transfer',
        contentWidget: contentDialogUpload(context),
        txtConfirm: 'Upload',
        isBtnDisable: true);
  }

  Widget dialogCancel(BuildContext context) {
    return AppDialogCancel(
        title: 'Batalkan Transaksi',
        contentText: 'Yakin untuk membatalkan transaksi $trxCode?',
        txtConfirm: 'Ya, Batalkan',
        onConfirm: controller.updateToCancelled);
  }

  Widget popMenu(BuildContext context) {
    return PopupMenuButton<MenuPopupTransaction>(
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColors.lightgray),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        color: Colors.white,
        icon: const Icon(
          Icons.more_vert,
          color: AppColors.blackv2,
          size: 40,
        ),
        onSelected: (MenuPopupTransaction item) {
          if (item.name == 'firstItem') {
            controller.trxIdActive = int.parse(trxID);
            Get.dialog(dialogUpload(context));
          } else if (item.name == 'secondItem') {
            Get.toNamed(AppRoutes.transactionDetail.replaceFirst(":id", trxID));
          } else if (item.name == 'thirdItem') {
            controller.trxIdActive = int.parse(trxID);
            Get.dialog(dialogCancel(context));
          }
        },
        itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<MenuPopupTransaction>>[
              PopupMenuItem<MenuPopupTransaction>(
                value: MenuPopupTransaction.firstItem,
                enabled: dropDownItemUpload(status),
                child: Text('Upload Bukti Transfer',
                    style: dropDownItemUpload(status)
                        ? AppStyles.txtDropdown
                        : AppStyles.txtDropdownDisabled),
              ),
              const PopupMenuItem<MenuPopupTransaction>(
                value: MenuPopupTransaction.secondItem,
                child: Text('Detail Transaksi', style: AppStyles.txtDropdown),
              ),
              PopupMenuItem<MenuPopupTransaction>(
                value: MenuPopupTransaction.thirdItem,
                enabled: dropDownItemCancel(status),
                child: Text('Batalkan Transaksi',
                    style: dropDownItemCancel(status)
                        ? AppStyles.txtDropdown
                        : AppStyles.txtDropdownDisabled),
              ),
            ]);
  }
}
