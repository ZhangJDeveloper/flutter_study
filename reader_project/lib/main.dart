import 'package:flutter/material.dart';
import 'core/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const _withe = 0xFFFFFFFF;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.white,
          splashColor: Colors.transparent
      ),
      initialRoute: ZJRouter.initialRoute,
      routes: ZJRouter.routes,
      onGenerateRoute: ZJRouter.generateRoute,
      onUnknownRoute: ZJRouter.unknowRoute,
    );
  }
}



