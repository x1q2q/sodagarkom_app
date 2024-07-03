import 'package:get_storage/get_storage.dart';
import '../../extensions/string_extensions.dart';

class StorageServices {
  final GetStorage _box = GetStorage();

  Future<void> checkDuplicate(String value) async {
    List<Map<String, dynamic>> dataList = await getData();
    List keywordOnBox =
        dataList.where((item) => item['value'] == value).toList();
    if (keywordOnBox.isNotEmpty) {
      await deleteData(keywordOnBox[0]['id']);
    }
  }

  void saveData(String value) async {
    // check if value stored before -> clear
    await checkDuplicate(value);
    List<Map<String, dynamic>> newDataList = await getData();
    newDataList.add({
      'id': ''.generateId(),
      'value': value,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    });
    await _box.write('searchHistory', newDataList);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    List<dynamic> storedData = _box.read<List>('searchHistory') ?? [];
    List<Map<String, dynamic>> dataList =
        storedData.map((e) => Map<String, dynamic>.from(e)).toList();
    dataList.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));
    return dataList;
  }

  Future<void> deleteData(String id) async {
    List<Map<String, dynamic>> dataList = await getData();
    dataList.removeWhere((item) => item['id'] == id);
    await _box.write('searchHistory', dataList);
  }
}
