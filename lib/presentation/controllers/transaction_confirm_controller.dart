import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction_confirm.dart';
import '../../presentation/services/toast_service.dart';
import 'carts_controller.dart';
import '../router/app_routes.dart';

class TransactionConfirmController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionConfirmController(this._transactionRepository);

  var infoChangeAddress = '*silahkan ganti alamat di menu profil';
  bool isLoading = true;
  bool isLoadingProcess = false;
  var isVisiblePaymentProof = false.obs;
  TransactionConfirm? trxConfirm;
  final box = GetStorage();
  int? customerId;

  @override
  void onInit() {
    super.onInit();
    fetchTransactionConfirm();
  }

  void changeVisionPayProof() {
    isVisiblePaymentProof.value = !isVisiblePaymentProof.value;
  }

  void fetchTransactionConfirm() async {
    customerId = box.read('customerId');
    try {
      TransactionConfirm fetchedTrxConfirm =
          await _transactionRepository.getTransactionConfirm(customerId!);
      trxConfirm = fetchedTrxConfirm;
      trxConfirm!.customerAddress =
          'Barang akan dikirim dengan penerima: (${fetchedTrxConfirm.customerName}), ke alamat berikut:\n\n ${fetchedTrxConfirm.customerAddress}';
      isLoading = false;
    } catch (e) {
      print('failed to fetch transaction confirm: $e');
    }
    update();
  }

  void insertTransactionConfirm() async {
    final CartsController cartController = Get.find();
    try {
      isLoading = true;
      Map<String, dynamic> result =
          await _transactionRepository.insertTransaction(trxConfirm!);
      isLoadingProcess = false;
      // do reset carts controller length
      ToastService.showToast('success', result['message']);
      Get.until((route) => route.settings.name == AppRoutes.appTab);
      cartController.qtyCarts.value = 0;
      cartController.carts.clear();
    } catch (e) {
      print('failed to insert transaction confirm: $e');
      ToastService.showToast('error', '$e');
    }
  }
}
