// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/persentaion/themes/my_custom_colors.dart';
import '../../data/models/data.dart';


class AllTasks extends StatefulWidget {
 
  const AllTasks({Key? key,}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  TextEditingController taskNameController = TextEditingController();
   DateTime? taskDueDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /* Navigator.of(context)
                .pushNamed(AddTaskScreen.routeName, arguments: tasks); */
          await showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Container(
                height: 600,
                color: Palette.myDarkAccent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: TextField(
                      controller: taskNameController,
                      decoration: InputDecoration(
                        hintText: "Enter Task Name",
                        labelStyle: TextStyle(color: Palette.myDarkColor),
                        label: Text("Task Name"),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  TextButton(
                    onPressed: () async {
                      taskDueDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100));
                      
                    },
                    child: Text("Due Date",
                      style: TextStyle(color: Palette.myDarkColor, fontSize: 20),
                    ),
                    //style: TextButton.styleFrom(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    
                  ),
                  onPressed: () async {
                    if (taskNameController.text != "") {
                      //Navigator.of(context).pop(taskNameController.text);
                      tasks.add(Task(taskName: taskNameController.text,dueDate: taskDueDate));

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Add Task")),
            ),
          ],
                  ),
                ),
              );
            },
          );

          setState(() {
           
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tasks[index].taskName,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:
                        tasks[index].isDone ? TextDecoration.lineThrough : null,
                  ),
            ),
            trailing: Checkbox(
              onChanged: (val) {
                setState(() {
                  tasks[index].isDone = val!;
                  if (tasks[index].isDone) {
                    tasks[index].doneTime = DateTime.now();
                  }
                });
              },
              value: tasks[index].isDone,
            ),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
