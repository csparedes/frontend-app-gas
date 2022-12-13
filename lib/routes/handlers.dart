import 'package:fluro/fluro.dart';

import '../pages/add_device_page.dart';
import '../pages/dashboard_page.dart';
import '../pages/login_page.dart';
import '../pages/not_found_page.dart';
import '../pages/register_page.dart';

class HandlerssApp {
  static Handler login =
      Handler(handlerFunc: ((context, parameters) => const LoginPage()));
  static Handler register =
      Handler(handlerFunc: ((context, parameters) => const RegisterPage()));
  static Handler dashboard =
      Handler(handlerFunc: ((context, parameters) => const DashboardPage()));
  static Handler addDevice =
      Handler(handlerFunc: ((context, parameters) => const AddDevicePage()));
  static Handler notFoundHandler = Handler(
    handlerFunc: (context, parameters) {
      return const NotFoundPage();
    },
  );
}
