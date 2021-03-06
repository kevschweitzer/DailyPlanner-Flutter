import 'package:dailyplanner/new_task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DailyPlanningScreen()
    );
  }

}

class DailyPlanningScreen extends StatefulWidget {
  @override
  createState() => new DailyPlanningState();
}

class DailyPlanningState extends State<DailyPlanningScreen> {
  final tasksList = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Planning")),
      body: _buildTasksView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTask,
        child: Icon(Icons.add)
      ),
    );
  }

  Future<void> _addNewTask() async {
    final newTaskName = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return NewTask();
        })
    );
    setState(() {
      tasksList.add(newTaskName);
    });
  }

  Widget _buildTasksView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasksList.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(tasksList[i]);
        });
  }

  Widget _buildRow(String task) {
    return ListTile(
        title: Text(task),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _removeTask(task);
          },
        )
    );
  }

  void _removeTask(String task) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete task'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Are you sure you want to delete the task?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  setState(() {
                    tasksList.removeWhere((element) => element == task);
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
}

