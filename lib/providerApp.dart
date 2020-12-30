
import 'package:flutter/material.dart';
import 'package:todolistapp/task_model.dart';

import 'db_helper.dart';

class AppProvider extends ChangeNotifier{
  int id;
  String taskName;
  bool isComplete;
  List<Task> tasks;
  
 
  
  insertTask(int id,String taskName,bool isComplete){
    DBHelper.dbHelper.insertNewTask(Task(this.taskName, this.isComplete, this.id));
    notifyListeners();
  }

    updateTask(Task task){
    DBHelper.dbHelper.updateTask(Task(task.taskName , task.isComplete = !task.isComplete , task.id));
    notifyListeners();
  }
  deleteTask(String taskName,bool isComplete,int id){
    this.taskName = taskName;
    this.isComplete =isComplete;
    notifyListeners();
  }

    
  

}