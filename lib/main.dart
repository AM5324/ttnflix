import 'package:flutter/material.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = TtnFlixAppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: TTNFlixTheme.lightTheme,
      darkTheme: TTNFlixTheme.darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}

