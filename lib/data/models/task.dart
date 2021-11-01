class Task {
  int? id;
  final String taskName;
  bool isDone;
  DateTime? doneTime;
  DateTime? dueDate;

  Task(
      {required this.taskName,
      this.isDone = false,
      this.id,
      this.doneTime,
      this.dueDate });

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      taskName: data['name'],
      isDone: data['is_done'],
      doneTime: data["done_time"],
      id: data['id'],
      dueDate: data['due_date'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": taskName,
      "is_done": isDone,
      "done_time": doneTime,
      "id": id,
      'due_date': dueDate,
    };
  }
}
