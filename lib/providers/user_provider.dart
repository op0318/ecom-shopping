import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';


class UserProvider extends ChangeNotifier
{
User _user=User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    token: '',
    type: '');


  User get user
  {
    return _user;
  }

  void setUser(String user)
  {
    _user=User.fromJson(user);
    notifyListeners();


  }

}