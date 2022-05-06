import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learngittestweb/states/connected_api.dart';
import 'package:learngittestweb/states/main_home.dart';
import 'package:learngittestweb/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  MyConstant.routeMainHome: (context) => const MainHome(),
  MyConstant.routeConnectedApi: (context) => const ConnectedAPI(),
};

void main() {
  HttpOverrides.global = MyHttpOverride();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: MyConstant.routeConnectedApi,
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
