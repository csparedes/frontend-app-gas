import 'dart:io';

import 'package:app_gas/services/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_gas/api/api_uno.dart';
import 'package:flutter/services.dart';

import '../routes/routes.dart';
import '../services/navigation_services.dart';
import '../services/notification_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  bool isLogin = false;
  get getIsLogin => isLogin;
  set setIsLogin(bool value) {
    isLogin = value;
    notifyListeners();
  }

  login() async {
    try {
      final loginResponse = await ApiUno.postNoHeader('/auth/login', {
        "email": emailCtrl.text.trim(),
        "clave": passwordCtrl.text,
      });
      print(loginResponse.data);
      if (loginResponse.status != 200) {
        NotificationServices.showSnackbarError(loginResponse.data['msg']);
      } else {
        LocalStorage.preferences.setString(
          'idCliente',
          loginResponse.data['user']['idCliente'].toString(),
        );
        LocalStorage.preferences.setString(
          'x-token',
          loginResponse.data['token'],
        );
        NavigationServices.pushReplacement(RoutesFluroApp.dashboard);
      }
    } catch (e) {
      print(e);
      NotificationServices.showSnackbarError('Error en la conexión');
    }
  }

  logout() async {
    LocalStorage.preferences.remove('idCliente');
    LocalStorage.preferences.remove('token');
    return await SystemChannels.platform
        .invokeMethod('SystemNavigator.pop', true);
  }
}
