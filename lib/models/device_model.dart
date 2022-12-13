class DeviceModel {
  DeviceModel({
    this.idDispositivo,
    this.idCliente,
    this.idMac,
    this.latitud,
    this.longitud,
    this.ubicacion,
    this.fechaUltimaLectura,
    this.lectura,
  });

  final int? idDispositivo;
  final int? idCliente;
  final String? idMac;
  final double? latitud;
  final double? longitud;
  final String? ubicacion;
  final String? fechaUltimaLectura;
  final double? lectura;

  factory DeviceModel.fromMap(Map<String, dynamic> json) => DeviceModel(
        idDispositivo: json["idDispositivo"],
        idCliente: json["idCliente"],
        idMac: json["idMAC"],
        latitud: json["Latitud"].toDouble(),
        longitud: json["Longitud"].toDouble(),
        ubicacion: json["ubicacion"],
        fechaUltimaLectura: json["fechaUltimaLectura"],
        lectura: json["lectura"] == null ? 0 : json["lectura"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "idDispositivo": idDispositivo,
        "idCliente": idCliente,
        "idMAC": idMac,
        "Latitud": latitud,
        "Longitud": longitud,
        "ubicacion": ubicacion,
        "fechaUltimaLectura": fechaUltimaLectura,
        "lectura": lectura,
      };
}
