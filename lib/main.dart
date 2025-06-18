import 'package:ecommerce/config/observing/blocobserving.dart';
import 'package:ecommerce/config/routes/routes.dart';
import 'package:ecommerce/core/Dependency_njection/service_locator.dart';
import 'package:ecommerce/core/constants/Appthemes.dart';
import 'package:ecommerce/features/auth/presentation/viewmodel/bloc/Auth_bloc/auth_bloc.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  var box = await Hive.openBox('authBox');
  await initServiceLocator(box);
  Bloc.observer = Observer();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => sl<AuthBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: RouteManager.router,
      ),
    );
  }
}
