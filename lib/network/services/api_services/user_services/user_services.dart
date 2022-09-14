import 'package:bloc_api/data/models/usermodel/user_model.dart';
import 'package:bloc_api/network/services/api_constants/api_constatns.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class UserServices {
  // var dioBaseOption = BaseOptions(
  //   baseUrl: ApiConstants.baseUrl,
  //   connectTimeout: ApiConstants.connectionTimeout,
  //   receiveTimeout: ApiConstants.receiveTimeout,
  //   responseType: ResponseType.json,
  //   sendTimeout: ApiConstants.sendTimeout,

  // );
  final Dio _dio = Dio();

  Future<List<UserModel>> getListofUserModels() async {
    List<UserModel> userLists = [];
    try {
      final response =
          await _dio.get(ApiConstants.baseUrl + ApiConstants.users);
      if (response.statusCode == 200) {
        final List respnonseData = response.data;
        userLists = respnonseData.map((e) => UserModel.fromJson(e)).toList();
        Logger().i("data loaded successfully");
      }
    } on DioError catch (e) {
      // throw DioException.fromDioError(e).toString();
      Logger().d("printing from dio error");
      Logger().e(e.toString());
    } catch (e) {
      Logger().e(e.toString());
    }
    return userLists;
  }
}
