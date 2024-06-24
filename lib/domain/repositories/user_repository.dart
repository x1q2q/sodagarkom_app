import '../../data/network.dart';
import '../models/User.dart';

class UserRepository {
  final NetworkService _networkService;

  UserRepository(this._networkService);

  Future<User> getUserByID() async {
    final response = await _networkService.fetchData('customer/8');
    if (response.statusCode == 200) {
      final Map datas = Map.from(response.data);
      return User.fromMap(datas['data'][0]);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
