import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/modules/helper.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/modules/theme.dart';

void main() {
  runApp(
    ModularApp(
      module: RouteModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyHyundai',
      theme: CustomTheme.theme,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: child as Widget,
        );
      },
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
