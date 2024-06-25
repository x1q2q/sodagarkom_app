import 'package:get/get.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction.dart';

class TransactionConfirmController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionConfirmController(this._transactionRepository);
  var TransactionConfirm =
      Transaction(id: 0, userId: 0, status: 'selesai', createdAt: '2024-10-05')
          .obs;
  var addressReceiver =
      ''' Barang akan dikirim dengan penerima: Username1, ke alamat berikut: 
      Jl. desa karangtengah, pengadegan, Kab. Purbalinga 53393  ''';
  var paymentMethod = ''' Silahkan transfer manual ke nomer rekening berikut:
- BRI (+62) 820000213291231, a.n Aleksander Grahambell
- BCA (+46) 8394238022342, a.n Aleksander Grahambell
- BNI  (+46) 8394238022342, a.n Aleksander Grahambell ''';

  var infoChangeAddress = '*silahkan ganti alamat di menu profil';

  @override
  void onInit() {
    super.onInit();
  }

  void fetchTransactionConfirm() async {}
}
