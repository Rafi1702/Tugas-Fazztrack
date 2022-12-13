import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../viewModel/userViewmodel.dart';
import 'MyHomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  userViewModel _post = Get.put(userViewModel());
  final password = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 64),
              child: Text('Zwallet',
                  style: TextStyle(
                      color: Color(0xFF6379F4),
                      fontSize: 26,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 564,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.1),
                      blurRadius: 0.05)
                ],
              ),
              child: Column(children: [
                Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text('Login',
                        style: TextStyle(
                            color: Color(0xFF3A3D42),
                            fontSize: 24,
                            fontWeight: FontWeight.w700))),
                Container(
                  height: 53,
                  margin: EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Login to your existing account to access',
                          style: TextStyle(
                            color: Color(0xFF3A3D42).withOpacity(0.6),
                            fontSize: 16,
                          )),
                      Text('all the features in Zwallet',
                          style: TextStyle(
                            color: Color(0xFF3A3D42).withOpacity(0.6),
                            fontSize: 16,
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 32),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFA9A9A9).withOpacity(0.6)),
                      ),
                      // focusedBorder: UnderlineInputBorder(
                      //     borderSide: BorderSide(color: Color(0xFF6379F4))),
                      hintText: "Enter your e-mail",
                      hintStyle: TextStyle(
                          color: Color(0xFFA9A9A9).withOpacity(.8),
                          fontSize: 16),
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: ImageIcon(AssetImage('lib/images/mail.png'),
                              size: 24)),
                      prefixIconColor: Color(0xFFA9A9A9),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 48),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFA9A9A9).withOpacity(0.6)),
                      ),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                          color: Color(0xFFA9A9A9).withOpacity(0.8),
                          fontSize: 16),
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: ImageIcon(AssetImage('lib/images/lock.png'),
                              size: 24)),
                      prefixIconColor: Color(0xFFA9A9A9),
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: ImageIcon(
                            AssetImage('lib/images/eye-crossed.png'),
                            size: 24),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.only(
                        top: 16,
                        right: 24,
                      ),
                      child: Text('Forgot password?',
                          style: TextStyle(
                            color: Color(0xFF3A3D42).withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ))),
                ),
                Container(
                    margin: EdgeInsets.only(top: 72, left: 16, right: 16),
                    height: 57,
                    width: 343,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Login',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            )),
                        onPressed: () async {
                          await _post.postDataToApi(
                              email: "lukmanssefriyanto@gmail.com",
                              password: "test123456");
                          if (_post.valid(_post.result.statusCode)) {
                            print(_post.result);
                            Get.off(MyHomePage());
                          } else {
                            Get.defaultDialog(
                                middleText: 'test',
                                title: 'failed',
                                confirm: ElevatedButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Get.back();
                                    }));
                          }
                          ;
                        })),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Text.rich(
                    TextSpan(
                        text: 'Don\'t have an account? Let\'s ',
                        children: [
                          TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: Color(0xFF6379F4),
                                fontWeight: FontWeight.w700,
                              ))
                        ]),
                  ),
                )
              ]),
            ),
          )
        ],
      )),
    );
  }
}
