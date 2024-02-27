import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../model/product.dart';
import '../../../providers/user_provider.dart';

class HomeService {
  Future<List<Product>> fetchCategeoryWiseProducts({
    required BuildContext context,
    required String Categeory,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> products = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/products?category=$Categeory'),
        headers: {
          'Content-Type': 'application/json; ' 'charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
      );
      httpErrorHandle(
          response: res,
          snackbar: context,
          onSucces: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              products.add(
                  Product.fromJson(
                      jsonEncode(
                          jsonDecode(res.body)[i])
                  ,)
              ,);
            }
          });
    } catch (e) {
      ShowSnakbar(context, e.toString());
    }

    return products;
  }
}
