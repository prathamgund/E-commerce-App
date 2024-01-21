// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/base.dart';
import 'package:flutter_first_app/core/store.dart';
import 'package:flutter_first_app/pages/cart.dart';
import 'package:flutter_first_app/utils/routes.dart';
import 'package:flutter_first_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/login.dart';

void main() {
  runApp(VxState(store: AppStore(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.LightMode(context),
      darkTheme: AppTheme.DarkMode(context),
      initialRoute: Routes.baseRoute,
      routes: {
        "/": (context) => const Login(),
        // "/": (context) => const Base(),
        Routes.loginRoute: (context) => const Login(),
        Routes.baseRoute: (context) => const Base(),
        Routes.cartRoute: (context) => const Cart()
      },
    );
  }
}
