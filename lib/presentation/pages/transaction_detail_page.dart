import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'package:get/get.dart';
import '../controllers/transaction_detail_controller.dart';
import '../../core/core.dart';
import '../widgets/widgets.dart';
import '../../extensions/string_extensions.dart';

final TransactionDetailController controller = Get.find();

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppbar(title: 'Detail Transaksi'),
        backgroundColor: AppColors.lightgray,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: GetBuilder<TransactionDetailController>(
                      builder: (dx) => Column(children: <Widget>[
                            boxWhite(headerStatus(dx)),
                            boxWhite(listProduct(dx)),
                            boxWhite(transferProof(dx)),
                            boxWhite(totalPayment(dx), withNoPadding: true)
                          ]))));
        })));
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

  Widget headerStatus(dynamic controller) {
    String status = controller.isLoading ? '' : controller.transaction!.status;
    return controller.isLoading
        ? AppSkeleton.shimmerTransaction
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SpanStatus(text: status.txtStatusDetail(), tipe: status),
              AppStyles.vSpaceXSmall,
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: RowLabel(
                      field: 'Kode Transaksi',
                      value: controller.transaction!.code,
                      fieldKeyStyle: AppStyles.fieldLabelVal,
                      fieldValStyle: AppStyles.fieldLabelKey)),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: RowLabel(
                      field: 'Tangal Pembelian',
                      value: controller.transaction!.createdAt,
                      fieldKeyStyle: AppStyles.fieldLabelVal)),
            ],
          );
  }

  Widget listProduct(dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerListProducTrx
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Daftar Produk', style: AppStyles.fieldLabelKey),
              AppStyles.vSpaceSmall,
              ListView.separated(
                  itemCount: controller.transaction!.products!.length,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(color: AppColors.grayv1),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    String productName =
                        controller.transaction!.products![index].productName;
                    String productImage =
                        controller.transaction!.products[index].productImage;
                    String productPrice = controller
                        .transaction!.products![index].productPrice
                        .toString()
                        .toRupiah();
                    String productQuantity = controller
                        .transaction!.products![index].productQuantity
                        .toString();
                    return ProductTransactionCard(
                        productName: productName,
                        productPrice: productPrice,
                        productQty: productQuantity,
                        productImage: (productImage.isEmpty)
                            ? AppSvg.imgNotFound
                            : Image.network(
                                '${Core.pathAssetsProduct}$productImage',
                                fit: BoxFit.cover));
                  }),
            ],
          );
  }

  Widget imageBukti(dynamic controller) {
    String image =
        controller.isLoading ? '' : controller.transaction!.paymentProof;
    return (controller.transaction!.status == 'reserved')
        ? const Text('Anda perlu mengupload bukti transfer terlebih dahulu',
            style: AppStyles.trxProductDesc)
        : (image.isEmpty)
            ? AppSvg.imgNotFoundPotrait
            : Image.network(
                '${Core.pathAssetsPayment}${controller.transaction!.paymentProof}',
                width: 200,
              );
  }

  Widget transferProof(dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerSpan
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Bukti Transfer',
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
                        child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 15.0),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: AppColors.lightgray,
                                borderRadius: BorderRadius.circular(10)),
                            child: imageBukti(controller)))))
              ]);
  }

  Widget totalPayment(dynamic controller) {
    return controller.isLoading
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: AppSkeleton.shimmerTransactionTotal)
        : Column(children: <Widget>[
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: RowLabel(
                    field: 'Metode Pembayaran',
                    value: 'Transfer Manual',
                    fieldKeyStyle: AppStyles.fieldLabelKey)),
            const Divider(color: AppColors.lightgray),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: RowLabel(
                    field: 'Biaya Ongkos Kirim',
                    value: 'Rp.35.000',
                    fieldKeyStyle: AppStyles.fieldLabelVal)),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child: RowLabel(
                    field:
                        'Total Harga (${controller.transaction!.products!.length} Barang)',
                    value: '${controller.transaction!.totalAmountProduct}'
                        .toRupiah(),
                    fieldKeyStyle: AppStyles.fieldLabelVal)),
            const Divider(color: AppColors.lightgray),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                child: RowLabel(
                    field: 'Total Pembayaran',
                    value: '${controller.transaction!.totalAmount}'.toRupiah(),
                    fieldKeyStyle: AppStyles.fieldLabelKey)),
          ]);
  }
}
