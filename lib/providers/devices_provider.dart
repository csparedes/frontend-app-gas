import 'package:flutter/material.dart';

import '../api/api_uno.dart';
import '../models/device_model.dart';
import '../responses/devices_response.dart';
import '../services/local_storage.dart';
import '../services/notification_services.dart';

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
      debugPrint(e.toString());
      return [];
    }
  }
}
