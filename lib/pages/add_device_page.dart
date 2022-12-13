import 'package:app_gas/pages/widgets/button_form_app.dart';
import 'package:app_gas/pages/widgets/input_field_form_app.dart';
import 'package:app_gas/routes/routes.dart';
import 'package:app_gas/services/navigation_services.dart';
import 'package:app_gas/services/notification_services.dart';
import 'package:flutter/material.dart';

class AddDevicePage extends StatelessWidget {
  const AddDevicePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController macCtrl = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Device')),
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('MAC'),
              InputFieldFormApp(
                label: '',
                hint: '',
                controller: macCtrl,
                onChange: (value) {},
              ),
              const Text('Ubicación'),
              InputFieldFormApp(
                label: '',
                hint: '',
                controller: TextEditingController(),
              ),
              ButtonFormApp(
                  onPressed: () {
                    NotificationServices.showSnackbarSuccess(
                        'Se agregó un nuevo dispositivo');
                    NavigationServices.pushReplacement(
                        RoutesFluroApp.dashboard);
                  },
                  label: 'Add'),
            ],
          ),
        ),
      ),
    );
  }
}
