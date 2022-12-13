import 'package:app_gas/routes/handlers.dart';
import 'package:fluro/fluro.dart';

class RoutesFluroApp {
  static final FluroRouter router = FluroRouter();

  static String login = '/login';
  static String register = '/register';
  static String dashboard = '/dashboard';
  static String addDevice = '/addDevice';

  static configureRoutes() {
    router.notFoundHandler = HandlerssApp.notFoundHandler;
    router.define(
      login,
      handler: HandlerssApp.login,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      register,
      handler: HandlerssApp.register,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      dashboard,
      handler: HandlerssApp.dashboard,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      addDevice,
      handler: HandlerssApp.addDevice,
      transitionType: TransitionType.cupertino,
    );
  }
}
