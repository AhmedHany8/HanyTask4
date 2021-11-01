import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/models/task.dart';
import '../../data/models/data.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> done;
    done = tasks.where((element) => element.isDone == true).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            done[index].taskName,
          ),
          trailing:
              Text(DateFormat('dd/MM').add_jm().format(done[index].doneTime!)),
          
        );
      },
      itemCount: done.length,
    );
  }
}
