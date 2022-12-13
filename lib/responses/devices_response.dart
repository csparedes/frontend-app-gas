// To parse this JSON data, do
//
//     final devicesResponse = devicesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:app_gas/models/device_model.dart';

DevicesResponse devicesResponseFromMap(String str) =>
    DevicesResponse.fromMap(json.decode(str));

String devicesResponseToMap(DevicesResponse data) => json.encode(data.toMap());

class DevicesResponse {
  DevicesResponse({
    required this.msg,
    required this.dispositivos,
  });

  final String msg;
  final List<DeviceModel> dispositivos;

  factory DevicesResponse.fromMap(Map<String, dynamic> json) => DevicesResponse(
        msg: json["msg"],
        dispositivos: List<DeviceModel>.from(
            json["dispositivos"].map((x) => DeviceModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "msg": msg,
        "dispositivos": List<dynamic>.from(dispositivos.map((x) => x.toMap())),
      };
}
