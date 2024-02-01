import 'dart:io';
import 'package:amazon_clone/constants/utils.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';

class AdminService {
  void sellProduct(
      {required BuildContext context,
      required String name,
      required double price,
      required double quantity,
      required String categeory,
      required List<File> images}) async {
    try {
      final cloudinaryPublic = CloudinaryPublic('defz6xpl6', 'amgxnyvi');
      List<String> imageUrl = [];

      for (int i = 0; i < imageUrl.length; i++) {
        CloudinaryResponse res = await cloudinaryPublic
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrl.add(res.secureUrl);
      }
    } catch (e) {
      ShowSnakbar(context, e.toString());
    }
  }
}
