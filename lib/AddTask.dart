import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/providerApp.dart';
import 'package:todolistapp/task_model.dart';
import 'db_helper.dart';

class AddTask extends StatefulWidget {
  @override
  _NewTasksState createState() => _NewTasksState();
}


class _NewTasksState extends State<AddTask> {
  int id;
  bool isComplete = false;
  String taskName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context){
       return AppProvider();
      },
          child: Scaffold(
       body: Container(
           
         padding: EdgeInsets.symmetric(horizontal: 40,vertical: 60),
         child: Column(
           
           crossAxisAlignment:CrossAxisAlignment.start,
           children: [
             GestureDetector(
               onTap:() => Navigator.pop(context),
               child: Icon(
                 Icons.arrow_back_ios,
                 size:30,
                 color:Colors.blue,
               ),
             ),
             SizedBox(height: 20),
             Text(
               "Add Task",
               style: TextStyle(
                 color:Colors.black,
                 fontSize: 35,
                 fontWeight: FontWeight.bold
               ),
             ),
            SizedBox(height: 10),
             Form(
               child: Column(
                 children: [
                   Padding(
                    padding:EdgeInsets.symmetric(vertical: 20),
             child: TextField(
                style: TextStyle(fontSize: 15),
                   decoration: InputDecoration(
                     labelText: 'Task Title',
                     labelStyle: TextStyle(fontSize: 15),
                     border: OutlineInputBorder(borderRadius:BorderRadius.circular(10) )
                   ),
                   onChanged: (value) {
                  this.taskName = value;
                },
              ),
                   ),
              Checkbox(
                value: isComplete,
                onChanged: (value) {
                  this.isComplete = value;
                  setState(() {});
                },
              ),
                Container(
               
                     margin: EdgeInsets.symmetric(vertical: 20),
                     height: 60,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color:Colors.blueAccent,
                       borderRadius: BorderRadius.circular(30)
                     ),
                     child: FlatButton(
                       onPressed:(){
                        //  DBHelper.dbHelper.insertNewTask(
                        //  Task(this.taskName, this.isComplete, this.id));
                        // value.
                                   Provider.of<AppProvider>(context, listen: false).insertTask(this.id,this.taskName, this.isComplete);

                         Navigator.pop(context);}
                     , child: Text(
                       'Add',
                       style: TextStyle(
                         color:Colors.white,
                         fontSize: 20
                       ),)),
                     
                  
                    )
            ],
          ),
        ),
           ],
              
       )
      )
      ),
    );
  }
}
