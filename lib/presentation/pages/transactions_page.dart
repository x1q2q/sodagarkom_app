import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'package:get/get.dart';
import '../controllers/transactions_controller.dart';
import '../../core/assets.dart';
import '../widgets/section_chips.dart';
import '../widgets/transaction_card.dart';
import '../widgets/app_svg.dart';
import '../widgets/btn_circle.dart';
import '../widgets/app_dialog_upload.dart';
import '../widgets/app_dialog_cancel.dart';
import '../router/app_routes.dart';

class TransactionsPage extends StatelessWidget {
  final TransactionsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    sectionStatus(context),
                    listTransaction(context)
                  ])));
        })));
  }

  Widget sectionStatus(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 90,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[SectionChips(controller: controller)]));
  }

  Widget contentDialogUpload(BuildContext context) {
    final String textContent =
        '''Pastikan anda sudah transfer sebesar: Rp. 35.000.0000, ke salah satu nomor rekening berikut :
    - BRI (+62) 820000213291231, a.n Aleksander Grahambell
    - BCA (+46) 8394238022342, a.n Aleksander Grahambell.''';
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(textContent, style: AppStyles.dialogContent),
          AppStyles.vSpaceMedium,
          Text('Jika sudah, upload bukti transfer di sini: ',
              style: AppStyles.dialogContent),
          AppStyles.vSpaceXSmall,
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.lightgray,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BtnCircle(
                            widget: AppSvg.galleryAdd,
                            bgColor: AppColors.lightgray,
                            size: 120,
                            padding: 20,
                            onTap: () {
                              print('galeri');
                            }),
                        Text('Galeri', style: AppStyles.productNameTile)
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BtnCircle(
                            widget: AppSvg.cameraAdd,
                            bgColor: AppColors.lightgray,
                            size: 120,
                            padding: 20,
                            onTap: () {
                              print('kamera');
                            }),
                        Text('Kamera', style: AppStyles.productNameTile)
                      ])
                ]),
          )
        ]);
  }

  Widget listTransaction(BuildContext context) {
    final dialogUpload = AppDialogUpload(
        title: 'Upload Bukti Transaksi',
        contentWidget: contentDialogUpload(context),
        txtConfirm: 'Upload',
        onConfirm: () {});

    final dialogCancel = AppDialogCancel(
        title: 'Batalkan Transaksi',
        contentText: 'Yakin untuk membatalkan transaksi #trx-01-20240618 ?',
        txtConfirm: 'Ya, Batalkan',
        onConfirm: () {});
    return ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) =>
            AppStyles.vSpaceSmall,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return TransactionCard(
              trxID: '#TRX-01-20240618',
              trxDate: '30 Juni 2024',
              status: 'reserved',
              productName: 'Laptop Asus Aspire Pro ${index + 1}',
              productQty: '1',
              trxQtyRemaining: '2',
              totalAmount: 'Rp.5000.000',
              productImage: Image.asset(
                Assets.dummLaptop,
                fit: BoxFit.cover,
              ),
              dialogUpload: dialogUpload,
              dialogCancel: dialogCancel,
              onTapCard: () {
                String transactionId = '1';
                Get.toNamed(
                    '${AppRoutes.transactionDetail.replaceFirst(":id", transactionId)}');
              },
              controller: controller);
        });
  }
}
