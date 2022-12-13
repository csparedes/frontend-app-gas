import 'package:app_gas/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/devices_provider.dart';
import '../routes/routes.dart';
import '../services/navigation_services.dart';
import 'widgets/card_info_gas.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    final devicesProvider = Provider.of<DevicesProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            IconButton(
              onPressed: () {
                NavigationServices.navigateTo(RoutesFluroApp.addDevice);
              },
              icon: const FaIcon(FontAwesomeIcons.circlePlus),
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.arrowDownUpAcrossLine),
              title: const Text('Cerrar Sesión y salir'),
              onTap: () => authenticationProvider.logout(),
            )
          ],
        )),
        body: FutureBuilder(
          future: devicesProvider.getAllDevices(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final listDevices = snapshot.data;
            if (listDevices!.isEmpty) {
              return const Center(child: Text('No hay Dispositivos'));
            }
            return ListView(
              children: listDevices.map(
                (e) {
                  return CardInfoGas(
                    pointerValue: e.lectura!,
                    topTitle: e.ubicacion!,
                    infoTitle: e.idDispositivo!.toString(),
                    subTitle: e.idMac!,
                    about: e.latitud!.toString(),
                    aboutTitle: e.longitud.toString(),
                    location: e.ubicacion!,
                  );
                },
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}
