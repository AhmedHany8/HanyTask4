import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/models/task.dart';
import '../../data/models/data.dart';

class ToDoScreen extends StatelessWidget {
  
  const ToDoScreen({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Task> toDoTasks;
    toDoTasks = tasks.where((element) => element.isDone == false).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(toDoTasks[index].taskName),
          subtitle: Text(DateFormat('dd/MM').add_jm().format(toDoTasks[index].dueDate!)),
        );
      },
      itemCount: toDoTasks.length,
    );
    
  }
}
