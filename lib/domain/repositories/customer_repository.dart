import '../../data/network.dart';
import '../models/customer.dart';

class CustomerRepository {
  final NetworkService _networkService;

  CustomerRepository(this._networkService);

  Future<Customer> getUserByID(String customerId) async {
    final response = await _networkService.fetchData('customer/$customerId');
    if (response.statusCode == 200) {
      final Map datas = Map.from(response.data);
      return Customer.fromJson(datas['data'][0]);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<Map<String, dynamic>> updateUser(Customer data) async {
    final response = await _networkService
        .updateData('customer/update_profile', {...data.toJson()});
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = Map.from(response.data);
      return result;
    } else {
      throw Exception('Failed to update profile user');
    }
  }
}
