import 'package:assignment_4/App_Provider.dart';
import 'package:assignment_4/DBHelper.dart';
import 'package:assignment_4/taskPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return AppProvider();
      },
      child: MaterialApp(
        home: taskPage(),
      ),
    );
  }
}
