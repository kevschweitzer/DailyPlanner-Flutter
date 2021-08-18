import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewTaskScreen();
  }
}

class NewTaskScreen extends StatefulWidget{
  @override
  createState() => NewTaskState();
}

class NewTaskState extends State<NewTaskScreen> {
  final _newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Task")),
      body: Column(
        children: [
          TextField(
              controller: _newTaskController,
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Task title'
              )
          ),
          ElevatedButton(
              onPressed: () {
                final newTaskTitle = _newTaskController.text;
                Navigator.pop(context, newTaskTitle);
              },
              child: Text('Add')
          )
        ],
      ),
    );
  }

}