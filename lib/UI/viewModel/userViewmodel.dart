import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/model/userModel.dart';
import '../../Core/service/userService.dart';
import '../view/MyHomePage.dart';
import '../view/SecondPage.dart';

class UserViewModel extends GetxController {
  UserService service = UserService();
  List<UserModel> user;

  bool isBusy = true;
  String setUsername = "";
  String setEmail = "";
  String setPassword = "";

  Future getDataUser() async {
    isBusy = true;
    var response = await service.getUser();
    user = response;
    isBusy = false;
    update();
  }

  emailUser(String email) {
    setEmail = email;
  }

  passwordUser(String pass) {
    setPassword = pass;
  }

  userLogin(BuildContext context) async {
    var result =
        await service.userLogin(email: setEmail, password: setPassword);
    print(result.statusCode);

    if (result.statusCode == 200) {
      Get.off(MyHomePage(userName: setEmail));
    } else {
      Get.defaultDialog(
          title: "Failed on login",
          middleText: " ",
          confirm: ElevatedButton(
              child: Text("Ok"),
              onPressed: () {
                Get.back();
              }));
    }
  }

  sendCard(BuildContext context, int index) {
    Get.to(SecondPage(
      name: user[index].name,
      id: user[index].id,
      address: user[index].address.city,
    ));
  }
}
