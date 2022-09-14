import 'package:bloc_api/data/models/usermodel/user_model.dart';
import 'package:bloc_api/network/services/api_services/user_services/user_services.dart';

class UserRepository {
  final UserServices _services = UserServices();
  late List<UserModel> _userList;

  Future<List<UserModel>> getUsersLists() async {
    _userList = await _services
        .getListofUserModels()
        .then((value) => _userList = value);
    return _userList;
  }
}
