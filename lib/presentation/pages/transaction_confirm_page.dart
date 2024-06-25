import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../widgets/default_appbar.dart';
import '../widgets/row_label.dart';
import '../widgets/default_bottombar.dart';
import '../controllers/transaction_confirm_controller.dart';

class TransactionConfirmPage extends StatelessWidget {
  final TransactionConfirmController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightgray,
        appBar: DefaultAppbar(title: 'Konfirmasi Transaksi'),
        bottomNavigationBar: bottomAppBar(),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    boxWhite(addressReceiver()),
                    boxWhite(paymentMethod()),
                    boxWhite(totalPayment(), withNoPadding: true),
                  ])));
        })));
  }

  Widget bottomAppBar() {
    return DefaultBottombar(
        widget: ElevatedButton(
      child: Text('Submit Transaksi', style: AppStyles.btnTxtWhite),
      style: AppStyles.btnElevatedRed,
      onPressed: () {},
    ));
  }

  Widget boxWhite(Widget widget, {bool withNoPadding = false}) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 18.0),
        padding: !withNoPadding
            ? EdgeInsets.symmetric(vertical: 15, horizontal: 20)
            : EdgeInsets.all(0),
        alignment: Alignment.center,
        child: widget);
  }

  Widget addressReceiver() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Alamat Penerima', style: AppStyles.fieldLabelKey),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.lightgray,
                  borderRadius: BorderRadius.circular(10)),
              child: Text('${controller.addressReceiver}',
                  style: AppStyles.trxProductDesc)),
          Text('${controller.infoChangeAddress}',
              style: AppStyles.trxProductDesc)
        ]);
  }

  Widget paymentMethod() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Metode Pemayaran', style: AppStyles.fieldLabelKey),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.lightgray,
                  borderRadius: BorderRadius.circular(10)),
              child: Text('${controller.paymentMethod}',
                  style: AppStyles.trxProductDesc))
        ]);
  }

  Widget totalPayment() {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: RowLabel(
              field: 'Biaya Ongkos Kirim',
              value: 'Rp.35.000',
              fieldKeyStyle: AppStyles.fieldLabelVal)),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
          child: RowLabel(
              field: 'Total Harga(2 Barang)',
              value: 'Rp.51.000.000',
              fieldKeyStyle: AppStyles.fieldLabelVal)),
      Divider(color: AppColors.lightgray),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
          child: RowLabel(
              field: 'Total Pembayaran',
              value: 'Rp. 51.053.000',
              fieldKeyStyle: AppStyles.fieldLabelKey)),
    ]);
  }
}
