import 'package:assignment_4/App_Provider.dart';
import 'package:assignment_4/DBHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatelessWidget {

  DBHelper dbHelper;

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        body: Container(
          child: Consumer<AppProvider>(builder: (context, value, child) {
            return Column(
              children: [
                const Divider(
                  height: 5.0,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: value.allTasks(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return value.generateList(snapshot.data);
                      }
                      if (snapshot.data == null || snapshot.data.length == 0) {
                        return Text('No Task Found');
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ],
            );
          }),)
    );
  }


}
