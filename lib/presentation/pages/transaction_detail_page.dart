import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'package:get/get.dart';
import '../controllers/transaction_detail_controller.dart';
import '../../core/assets.dart';
import '../widgets/default_appbar.dart';
import '../widgets/row_label.dart';
import '../widgets/span_status.dart';
import '../widgets/product_transaction_card.dart';

class TransactionDetailPage extends StatelessWidget {
  final TransactionDetailController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final String transactionId = Get.parameters['id'] ?? 'unknown';
    return Scaffold(
        appBar: DefaultAppbar(title: 'Detail Transaksi'),
        backgroundColor: AppColors.lightgray,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    boxWhite(headerStatus()),
                    boxWhite(listProduct()),
                    boxWhite(transferProof()),
                    boxWhite(totalPayment(), withNoPadding: true)
                  ])));
        })));
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

  // Widget rowLabelKey(String key, String val, TextStyle fieldKeyStyle,
  //     {TextStyle? fieldValStyle}) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       Text(key, style: fieldKeyStyle),
  //       Text(val, style: fieldValStyle ?? fieldKeyStyle)
  //     ],
  //   );
  // }

  Widget headerStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SpanStatus(text: 'Pesanan Selesai', tipe: 'accepted'),
        AppStyles.vSpaceXSmall,
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: RowLabel(
                field: 'Kode Transaksi',
                value: '#TRX-01-20240512',
                fieldKeyStyle: AppStyles.fieldLabelVal,
                fieldValStyle: AppStyles.fieldLabelKey)),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: RowLabel(
              field: 'Tangal Pembelian',
              value: '10 Juni 2024, 12:16',
              fieldKeyStyle: AppStyles.fieldLabelVal)),
      ],
    );
  }

  Widget listProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Daftar Produk', style: AppStyles.fieldLabelKey),
        AppStyles.vSpaceSmall,
        ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: AppColors.grayv1),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ProductTransactionCard(
                  productName: 'Laptop Asus ${index + 1}',
                  productPrice: 'Rp.5000.000',
                  productQty: '1',
                  productImage: Image.asset(
                    Assets.dummLaptop,
                    fit: BoxFit.cover,
                  ));
            }),
      ],
    );
  }

  Widget transferProof() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Bukti Transfer', style: AppStyles.fieldLabelKey),
                IconButton(
                    onPressed: controller.changeVisionPayProof,
                    icon: Obx(() => Icon(
                        controller.isVisiblePaymentProof.value
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                        size: 30)))
              ]),
          Obx(() => Visibility(
              visible: controller.isVisiblePaymentProof.value,
              maintainAnimation: true,
              maintainState: true,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  opacity: controller.isVisiblePaymentProof.value ? 1 : 0,
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 15.0),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: AppColors.lightgray,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        Assets.dummTrfProof,
                        width: 200,
                      )))))
        ]);
  }

  Widget totalPayment() {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: RowLabel(
              field: 'Metode Pembayaran',
              value: 'Transfer Manual',
              fieldKeyStyle: AppStyles.fieldLabelKey)),
      Divider(color: AppColors.lightgray),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
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
