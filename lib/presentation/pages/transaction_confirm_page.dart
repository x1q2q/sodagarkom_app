import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../../core/core.dart';
import '../widgets/widgets.dart';
import '../controllers/transaction_confirm_controller.dart';
import '../../extensions/string_extensions.dart';

class TransactionConfirmPage extends StatelessWidget {
  const TransactionConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.lightgray,
            appBar: const DefaultAppbar(title: 'Konfirmasi Transaksi'),
            bottomNavigationBar: bottomAppBar(),
            body: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: GetBuilder<TransactionConfirmController>(
                          builder: (dx) => Column(children: <Widget>[
                                boxWhite(addressReceiver(dx)),
                                boxWhite(paymentMethod(dx)),
                                boxWhite(listProduct(dx)),
                                boxWhite(totalPayment(dx), withNoPadding: true),
                              ]))));
            })));
  }

  Widget bottomAppBar() {
    final TransactionConfirmController controller = Get.find();
    return DefaultBottombar(
        widget: ElevatedButton.icon(
      icon: const Text('Submit Transaksi', style: AppStyles.btnTxtWhite),
      label: AppSvg.trxSubmit,
      style: AppStyles.btnElevatedRed,
      onPressed: controller.insertTransactionConfirm,
    ));
  }

  Widget boxWhite(Widget widget, {bool withNoPadding = false}) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 18.0),
        padding: !withNoPadding
            ? const EdgeInsets.symmetric(vertical: 15, horizontal: 20)
            : const EdgeInsets.all(0),
        alignment: Alignment.center,
        child: widget);
  }

  Widget addressReceiver(dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerSpan
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                const Text('Alamat Penerima', style: AppStyles.fieldLabelKey),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: AppColors.lightgray,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('${controller.trxConfirm!.customerAddress}',
                        style: AppStyles.trxProductDesc,
                        textAlign: TextAlign.justify)),
                Text('${controller.infoChangeAddress}',
                    style: AppStyles.trxProductDesc)
              ]);
  }

  Widget listProduct(dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerListProducTrx
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Daftar Belanjaan',
                        style: AppStyles.fieldLabelKey),
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
                      child: ListView.separated(
                          itemCount: controller.trxConfirm!.products!.length,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(color: AppColors.grayv1),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var trx = controller.trxConfirm!.products![index];
                            return ProductTransactionCard(
                                productName: trx.productName,
                                totalPrice: '${trx.totalPrice}'.toRupiah(),
                                productQty: '${trx.productQuantity}',
                                productImage: (trx.productImage.isEmpty)
                                    ? AppSvg.imgNotFound
                                    : Image.network(
                                        '${Core.pathAssetsProduct}${trx.productImage}',
                                        fit: BoxFit.cover));
                          })))),
            ],
          );
  }

  Widget paymentMethod(dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerSpan
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                const Text('Metode Pembayaran', style: AppStyles.fieldLabelKey),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: AppColors.lightgray,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '${controller.trxConfirm!.paymentText}',
                      style: AppStyles.trxProductDesc,
                      textAlign: TextAlign.justify,
                    ))
              ]);
  }

  Widget totalPayment(dynamic controller) {
    return controller.isLoading
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: AppSkeleton.shimmerTransactionTotal)
        : Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: RowLabel(
                    field: 'Biaya Ongkos Kirim',
                    value: '${controller.trxConfirm!.totalShipping}'.toRupiah(),
                    fieldKeyStyle: AppStyles.fieldLabelVal)),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: RowLabel(
                    field:
                        'Total Harga (${controller.trxConfirm!.cartsQty} Barang)',
                    value: '${controller.trxConfirm!.cartsPrice}'.toRupiah(),
                    fieldKeyStyle: AppStyles.fieldLabelVal)),
            const Divider(color: AppColors.lightgray),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: RowLabel(
                    field: 'Total Pembayaran',
                    value: '${controller.trxConfirm!.totalAmount}'.toRupiah(),
                    fieldKeyStyle: AppStyles.fieldLabelKey)),
          ]);
  }
}
