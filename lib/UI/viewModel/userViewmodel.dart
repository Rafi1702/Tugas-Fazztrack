import 'package:dio/dio.dart';
import 'package:get/get.dart';

class userViewModel extends GetxController {
  List setData = [];
  var _dio = Dio();
  bool isBusy = true;
  var result;

  Future getDataFromApi() async {
    isBusy = true;
    result = await _dio.get("https://jsonplaceholder.typicode.com/users");
    setData = result.data;
    isBusy = false;

    update();
  }

  Future postDataToApi({String email, String password}) async {
    result = await _dio.post("http://23.20.237.176:8000/auth/login",
        data: {"email": email, "password": password});
    return result;
  }

  bool valid(var result) {
    if (result == 200) {
      return true;
    }
    return false;
  }
}
