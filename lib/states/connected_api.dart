// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learngittestweb/utility/my_constant.dart';

class ConnectedAPI extends StatefulWidget {
  const ConnectedAPI({Key? key}) : super(key: key);

  @override
  State<ConnectedAPI> createState() => _ConnectedAPIState();
}

class _ConnectedAPIState extends State<ConnectedAPI> {
  @override
  void initState() {
    super.initState();
    processConnectedAPI();
  }

  Future<void> processConnectedAPI() async {
    print('processConnectedAPI work');
    await Dio().get(MyConstant.pathBigC).then((value) {
      print('Connected OK ==> $value');
    }).catchError((onError) {
      print('Cannot Connected');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('This is Connected API'),
    );
  }
}
