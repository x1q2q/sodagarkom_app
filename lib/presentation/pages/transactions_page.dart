import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../controllers/transactions_controller.dart';
import '../../core/core.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';
import '../../extensions/string_extensions.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

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
                  child: GetBuilder<TransactionsController>(
                      builder: (dx) => Column(children: <Widget>[
                            sectionStatus(context, dx),
                            listTransaction(context, dx)
                          ]))));
        })));
  }

  Widget sectionStatus(BuildContext context, dynamic controller) {
    return Container(
        width: double.infinity,
        height: 90,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              controller.isLoading
                  ? AppSkeleton.shimmerChips
                  : SectionChips(controller: controller)
            ]));
  }

  Widget contentDialogUpload(BuildContext context) {
    const String textContent =
        '''Pastikan anda sudah transfer sebesar: Rp. 35.000.0000, ke salah satu nomor rekening berikut :
    - BRI (+62) 820000213291231, a.n Aleksander Grahambell
    - BCA (+46) 8394238022342, a.n Aleksander Grahambell.''';
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(textContent, style: AppStyles.dialogContent),
          AppStyles.vSpaceMedium,
          const Text('Jika sudah, upload bukti transfer di sini: ',
              style: AppStyles.dialogContent),
          AppStyles.vSpaceXSmall,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
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
                            widget: Column(
                              children: <Widget>[
                                AppSvg.galleryAdd,
                                Text('Galeri', style: AppStyles.productNameTile)
                              ],
                            ),
                            bgColor: AppColors.lightgray,
                            size: 120,
                            padding: 20,
                            onTap: () {
                              // print('galeri');
                            }),
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
                              // print('kamera');
                            }),
                        const Text('Kamera', style: AppStyles.productNameTile)
                      ])
                ]),
          )
        ]);
  }

  Widget listTransaction(BuildContext context, dynamic controller) {
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

    return controller.isLoading
        ? AppSkeleton.shimmerListView
        : ListView.separated(
            itemCount: controller.transactions!.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppStyles.vSpaceSmall,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var trx = controller.transactions![index];
              String id = '${trx.id}';
              return TransactionCard(
                  trxID: id,
                  trxCode: trx.code,
                  trxDate: '${trx.createdAt}'.toFormattedDate('dd MMMM yyyy'),
                  status: trx.status,
                  productName: trx.products[0].productName,
                  productQty: '${trx.products[0].productQuantity}',
                  trxQtyRemaining: '${trx.products.length - 1}',
                  totalAmount: '${trx.totalAmount}'.toRupiah(),
                  productImage: (trx.products[0].productImage.isEmpty)
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${trx.products[0].productImage}',
                          fit: BoxFit.cover),
                  dialogUpload: dialogUpload,
                  dialogCancel: dialogCancel,
                  onTapCard: () {
                    Get.toNamed(
                        AppRoutes.transactionDetail.replaceFirst(":id", id));
                  });
            });
  }
}
