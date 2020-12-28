import 'package:assignment_4/DBHelper.dart';
import 'package:assignment_4/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  Future<List<Task>> allTasksList = DBHelper.dbHelper.getTask();
  Future<List<Task>> completeTasksList = DBHelper.dbHelper.getCompleteTask();
  Future<List<Task>> inCompleteTasksList = DBHelper.dbHelper.getInCompleteTask();

  Future<int> updateResult;
  Future<int> deleteResult;

  allTasks() {
    allTasksList = DBHelper.dbHelper.getTask();
    notifyListeners();
    return allTasksList;
  }

  completeTasks() {
    completeTasksList = DBHelper.dbHelper.getCompleteTask();
    notifyListeners();
    return completeTasksList;
  }

  inCompleteTasks() {
    inCompleteTasksList = DBHelper.dbHelper.getInCompleteTask();
    notifyListeners();
    return inCompleteTasksList;
  }

  updateTask(Task task) {
    updateResult = DBHelper.dbHelper.update(task);
    notifyListeners();
    return updateResult;
  }

  daleteTask(int id) {
    deleteResult = DBHelper.dbHelper.delete(id);
    notifyListeners();
    return updateResult;
  }

  SingleChildScrollView generateList(List<Task> tasks) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('Delete'),
            ),
            DataColumn(
              label: Text('Task'),
            ),
            DataColumn(
              label: Text('IsComplete'),
            )
          ],
          rows: tasks
              .map(
                (task) => DataRow(
                  cells: [
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          daleteTask(task.id);
                        },
                      ),
                    ),
                    DataCell(
                      Text(task.name),
                    ),
                    DataCell(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                              value: task.isComplete == 1,
                              onChanged: (value) {
                                if (value == true) {
                                  task.isComplete = 1;
                                } else {
                                  task.isComplete = 0;
                                }
                                updateTask(task);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
