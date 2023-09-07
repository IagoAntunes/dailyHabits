import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:goodhabits/app_module.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
