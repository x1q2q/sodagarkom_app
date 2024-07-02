import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/app_dialog_upload.dart';
import '../../presentation/services/dialog_services.dart';
import '../../extensions/string_extensions.dart';
// import 'package:flutter/services.dart';

class TransactionsController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionsController(this._transactionRepository);

  var idChipSelected = 'all'.obs;
  List chips = [];
  bool isLoading = true;
  var transactions = <Transaction>[].obs;
  int? trxIdActive;
  bool isLoadingProcess = false;

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? filePhoto;
  final box = GetStorage();
  int? customerId;

  @override
  void onInit() async {
    super.onInit();
    handleRefresh();
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Future<void> handleRefresh() async {
    customerId = box.read('customerId');
    isLoading = true;
    update();
    fetchFilters();
  }

  void changeChip(bool selected, String filter) async {
    idChipSelected.value = selected ? filter : 'all';
    isLoading = true;
    fetchTransactionsFilter(filter);
  }

  void fetchFilters() async {
    try {
      List fetchedTransactions = await _transactionRepository.getFilters();
      chips = fetchedTransactions;
      idChipSelected.value = chips[0].id;
      fetchTransactionsFilter(chips[0].id);
    } catch (e) {
      print('failed to fetch filters: $e');
    }
  }

  void fetchTransactionsFilter(String filter) async {
    isLoading = true;
    try {
      List<Transaction> fetchedTransactions = await _transactionRepository
          .getTransactionsFilter(customerId!, filter);
      transactions.value = fetchedTransactions;
      isLoading = false;
    } catch (e) {
      print('failed to fetch transactions: $e');
    }
    update();
  }

  void updateToCancelled() async {
    int? transactionId = trxIdActive;
    String statusHandleTo = 'rejected';
    isLoadingProcess = true;
    try {
      Map<String, dynamic> result = await _transactionRepository
          .updateTransactionStatus(statusHandleTo, transactionId!);
      isLoadingProcess = false;
      Get.back();
      int index = transactions.indexWhere((item) => item.id == transactionId);
      transactions[index].status = statusHandleTo;
      update();
      DialogService.showToast('success', result['message']);
    } catch (e) {
      Get.back();
      DialogService.showToast('error', '$e'.extractMessage());
    }
  }

  Future getImage(String tipe) async {
    ImageSource media =
        tipe == 'camera' ? ImageSource.camera : ImageSource.gallery;
    final pickedFile = await _picker.pickImage(source: media);
    if (pickedFile != null) {
      Get.back();
      image = pickedFile;
      filePhoto = File(image!.path);

      Timer(const Duration(milliseconds: 500), () {
        Get.dialog(
          AppDialogUpload(
              title: 'Upload Bukti Transaksi',
              contentWidget: Center(
                  child: Image.file(filePhoto!,
                      fit: BoxFit.contain,
                      width: Get.width,
                      height: Get.height * .5)),
              txtConfirm: 'Upload',
              onConfirm: uploadImage,
              onCancel: Get.back,
              isBtnDisable: false),
          barrierDismissible: false,
        );
      });
    } else {
      DialogService.rawToast('tidak ada gambar terpilih');
    }
  }

  void uploadImage() async {
    int? transactionId = trxIdActive;
    String statusHandleTo = 'pending';
    try {
      Map<String, dynamic> result =
          await _transactionRepository.uploadImage(transactionId!, filePhoto!);
      isLoadingProcess = false;
      Get.back();
      int index = transactions.indexWhere((item) => item.id == transactionId);
      transactions[index].status = statusHandleTo;
      update();
      DialogService.showToast('success', result['message']);
    } catch (e) {
      Get.back();
      DialogService.showToast('error', '$e'.extractMessage());
    }
    update();
  }
}
