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
    final TransactionsController trasactionController = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
            backgroundColor: AppColors.redv2,
            color: Colors.white,
            strokeWidth: 2.0,
            onRefresh: () async {
              trasactionController.handleRefresh();
            },
            child: SafeArea(child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: GetBuilder<TransactionsController>(
                          builder: (dx) => Column(children: <Widget>[
                                sectionStatus(context, dx),
                                listTransaction(context, dx)
                              ]))));
            }))));
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

  Widget listTransaction(BuildContext context, dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerListView
        : controller.transactions.value.isEmpty
            ? Column(
                children: <Widget>[
                  AppSvg.emptyList,
                  const Text('Data transaksi masih kosong...',
                      style: AppStyles.descEmptyState)
                ],
              )
            : ListView.separated(
                itemCount: controller.transactions.value.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    AppStyles.vSpaceSmall,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var trx = controller.transactions.value[index];
                  String id = '${trx.id}';
                  return TransactionCard(
                      trxID: id,
                      trxCode: trx.code,
                      trxDate:
                          '${trx.createdAt}'.toFormattedDate('dd MMMM yyyy'),
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
                      onTapCard: () {
                        Get.toNamed(AppRoutes.transactionDetail
                            .replaceFirst(":id", id));
                      },
                      controller: controller);
                });
  }
}
