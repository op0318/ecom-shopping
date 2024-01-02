import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authservice
{
  //signupuser
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password
  })
  async{
    try
        {
          User user=User(
              id: '',
              name: name,
              email: email,
              password: password,
              address: '',
              token: '',
              type: '');
          //Post api service
          http.Response res= await http.post(
              Uri.parse('$uri'),
              body: user.tojson(),
          headers: <String,String>{
                'Content-Type':'application/json;charset=UTF-8'
          });
          httpErrorHandle(response: res, snackbar:context , onSucces: (){
            ShowSnakbar(context,'Account has been created with the same credentials');

          });
        }
        catch(e)
    {

        ShowSnakbar(context, e.toString());

    }

  }

}