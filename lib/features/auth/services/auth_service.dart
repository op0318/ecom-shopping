import 'dart:convert';

import 'dart:io';
import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  //signupuser
  void signUpUser(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          token: '',
          type: '');
      //Post api service
      http.Response res = await http.post(Uri.parse('$uri/signup'),
          body: user.tojson(),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          snackbar: context,
          onSucces: () {
            ShowSnakbar(
                context, 'Account has been created with the same credentials');
          });
    } catch (e) {
      ShowSnakbar(context, e.toString());
    }
  }

  void SigninUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    var res = await http.post(Uri.parse('$uri/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode({'email': email, 'password': password}));
    httpErrorHandle(
        response: res,
        snackbar: context,
        onSucces: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
              context, BottomBar.routeName, (route) => false);
        });
  }

  void GetUserData(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');

      if (token == null) {
        pref.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(Uri.parse('$uri/istokenvalid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      if (tokenRes == true) {
        final res = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        UserProvider userProvide = Provider.of<UserProvider>(context);
        userProvide.setUser(res.body);
      }
    } catch (e) {
      ShowSnakbar(context, e.toString());
    }
  }
}
