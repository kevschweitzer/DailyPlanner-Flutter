import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily Planner",
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

  void _addNewTask() {
    setState(() {
      tasksList.add("New Task 2");
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
        title: Text(task)
    );
  }
}

