import 'package:ecommerce/config/routes/routes.dart';
import 'package:ecommerce/core/constants/Appthemes.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  var box = await Hive.openBox('authBox');
  runApp(MyApp(authbox: box));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.authbox, super.key});
  final Box authbox;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system, // Follows system theme
      routerConfig: RouteManager.router,
    );
  }
}
