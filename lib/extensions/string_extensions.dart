import 'package:intl/intl.dart';

extension StringExtensions on String {
  String toRupiah() {
    final formatter =
        NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0);
    return formatter.format(int.parse(this));
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String toCapitalize() {
    return this.split(' ').map((word) => word.capitalize()).join(' ');
  }

  String toFormattedDate(String format) {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat(format, "id_ID").format(dateTime);
  }

  String txtStatusDetail() {
    switch (this) {
      case 'accepted':
        return 'Pesanan selesai';
      case 'pending':
        return 'Pesanan masih pending';
      case 'reserved':
        return 'Perlu upload bukti transfer';
      case 'rejected':
        return 'Pesanan dibatalkan';
      default:
        return 'Unknown Status';
    }
  }

  String txtStatusLabel() {
    switch (this) {
      case 'accepted':
        return 'Selesai';
      case 'pending':
        return 'Pending';
      case 'reserved':
        return 'Perlu Upload';
      case 'rejected':
        return 'Dibatalkan';
      default:
        return 'Unknown Status';
    }
  }
}
