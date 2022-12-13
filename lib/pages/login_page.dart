import 'package:app_gas/pages/widgets/button_form_app.dart';
import 'package:app_gas/pages/widgets/input_field_form_app.dart';
import 'package:app_gas/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 140),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'App Gas',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  InputFieldFormApp(
                    label: 'Email',
                    hint: 'john.doe@example.com',
                    keyboardType: TextInputType.emailAddress,
                    controller: authenticationProvider.emailCtrl,
                  ),
                  InputFieldFormApp(
                    label: 'Password',
                    hint: 'Your password',
                    isPassword: true,
                    controller: authenticationProvider.passwordCtrl,
                  ),
                  if (!authenticationProvider.isLogin)
                    ButtonFormApp(
                      onPressed: () {
                        authenticationProvider.setIsLogin = true;
                        FocusManager.instance.primaryFocus?.unfocus();
                        authenticationProvider.login();
                        authenticationProvider.setIsLogin = false;
                      },
                      label: 'Login',
                    ),
                  if (authenticationProvider.isLogin)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
