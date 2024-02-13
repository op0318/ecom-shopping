import 'dart:convert';
import 'dart:io';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/model/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminService {
  //This is an api call for adding a product data in the backend
  //authorization will be added in the api call
  //The file image first should be stored in a cloudinary and it will return a string of urls
  //

  void sellProduct(
      {required BuildContext context,
      required String description,
      required String name,
      required double price,
      required double quantity,
      required String Categeory,
      required List<File> images}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinaryPublic = CloudinaryPublic('defz6xpl6', 'amgxnyvi');
      List<String> imageUrl = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinaryPublic
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrl.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrl,
        Categeory: Categeory,
        price: price,
      );

      http.Response res = await http.post(Uri.parse('$uri/admin/addProduct'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          },
          body: jsonEncode({
            "name": name,
            "description": description,
            "images": imageUrl,
            "quantity": quantity,
            "price": price,
            "Categeory": Categeory,
          }));
      httpErrorHandle(
          response: res,
          snackbar: context,
          onSucces: () {
            ShowSnakbar(context, 'Product Added Successfully');
            Navigator.pop(context);
          });
    } catch (e) {
      ShowSnakbar(context, e.toString());
    }
  }
}
