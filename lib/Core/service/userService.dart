import 'package:dio/dio.dart';

import '../model/userModel.dart';

class UserService {
  var _dio = Dio();

  Future<List<UserModel>> getUser() async {
    try {
      var response =
          await _dio.get("https://jsonplaceholder.typicode.com/users");
      List<UserModel> _model =
          List<UserModel>.from(response.data.map((e) => UserModel.fromJson(e)));
      return _model;
    } catch (e) {
      throw Error();
    }
  }

  Future userLogin({email: String, password: String}) async {
    try {
      var response = await _dio.post("http://23.20.237.176:8000/auth/login",
          data: {"email": email, "password": password});
      return response;
    } catch (e) {
      print("CEK ERROR $e");
    }
  }
}
