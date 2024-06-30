import 'package:get/get.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction_confirm.dart';

class TransactionConfirmController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionConfirmController(this._transactionRepository);

//   var addressReceiver =
//       ''' Barang akan dikirim dengan penerima: Username1, ke alamat berikut:
//       Jl. desa karangtengah, pengadegan, Kab. Purbalinga 53393  ''';
//   var paymentMethod = ''' Silahkan transfer manual ke nomer rekening berikut:
// - BRI (+62) 820000213291231, a.n Aleksander Grahambell
// - BCA (+46) 8394238022342, a.n Aleksander Grahambell
// - BNI  (+46) 8394238022342, a.n Aleksander Grahambell ''';

  var infoChangeAddress = '*silahkan ganti alamat di menu profil';
  bool isLoading = true;
  TransactionConfirm? trxConfirm;

  @override
  void onInit() {
    super.onInit();
    fetchTransactionConfirm();
  }

  void fetchTransactionConfirm() async {
    try {
      int dummCustomerId = 9;
      TransactionConfirm fetchedTrxConfirm =
          await _transactionRepository.getTransactionConfirm(dummCustomerId);
      trxConfirm = fetchedTrxConfirm;
      trxConfirm!.customerAddress =
          'Barang akan dikirim dengan penerima: (${fetchedTrxConfirm.customerName}), ke alamat berikut:\n\n ${fetchedTrxConfirm.customerAddress}';
      isLoading = false;
    } catch (e) {
      print('failed to fetch transaction confirm: $e');
    }
    update();
  }
}
