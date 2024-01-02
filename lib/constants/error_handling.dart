
import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

//to handle the error the datas
//response for the post api request
//display tha error in the snackbar



void httpErrorHandle({
  required http.Response response,
  required BuildContext snackbar,
  required VoidCallback onSucces

})
{
  switch(response.statusCode)
  {
    case 200:
      return onSucces();
      break;
    case 400:
      return ShowSnakbar(snackbar ,jsonDecode(response.body)['msg']);
      break;
    case 500:
      return ShowSnakbar(snackbar, jsonDecode(response.body)['error']);
      default:
      ShowSnakbar(snackbar,jsonDecode(response.body));

  }

}