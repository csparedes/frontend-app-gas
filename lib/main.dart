import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import './providers/authentication_provider.dart';
import './providers/devices_provider.dart';
import './routes/routes.dart';
import './services/local_storage.dart';
import './services/navigation_services.dart';
import './services/notification_services.dart';
import './theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RoutesFluroApp.configureRoutes();
  await LocalStorage.configurePreferences();
  await dotenv.load(fileName: '.env');
  runApp(const AppProvider());
}

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DevicesProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Gas',
      initialRoute: '/login',
      navigatorKey: NavigationServices.navigatorKey,
      onGenerateRoute: RoutesFluroApp.router.generator,
      scaffoldMessengerKey: NotificationServices.messengerKey,
      theme: AppTheme.mainTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
