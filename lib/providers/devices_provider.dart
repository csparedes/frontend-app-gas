import 'dart:convert';

import 'package:app_gas/api/api_uno.dart';
import 'package:app_gas/models/device_model.dart';
import 'package:app_gas/responses/devices_response.dart';
import 'package:app_gas/services/local_storage.dart';
import 'package:app_gas/services/notification_services.dart';
import 'package:flutter/material.dart';

class DevicesProvider extends ChangeNotifier {
  Future<List<DeviceModel>> getAllDevices() async {
    try {
      final idCliente = LocalStorage.preferences.getString('idCliente');
      final devicesResponse =
          await ApiUno.get('/dispositivos/idCliente/$idCliente');
      if (devicesResponse.status == 200) {
        final decodedData = DevicesResponse.fromMap(devicesResponse.data);
        NotificationServices.showSnackbarSuccess(decodedData.msg);
        return decodedData.dispositivos;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
