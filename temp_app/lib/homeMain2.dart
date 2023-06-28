import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> _tasks = [];

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }


void _editTask(Task task) {
    
      //_tasks.add(task);
                                          setState(() {
                                            task.title =
                                                _titleController.text.trim();
                                            task.description =
                                                _descriptionController.text
                    
                                            task.deadline = _selectedDateTime!;

                                        
                                            _titleController.clear();
                                            _descriptionController.clear();
                                            _textEditingDateTimeController
                                                .clear();
    });
  }



  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  void _showTaskDetails(Task task) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                task.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8.0),
              Text(
                'Deadline: ${task.deadline}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _deleteTask(task);
                  Navigator.pop(context);
                },
                child: Text('Delete Task'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_tasks[index].title),
            subtitle: Text(_tasks[index].description),
            onTap: () => _showTaskDetails(_tasks[index]),
            onLongPress: () => _showTaskDetails(_tasks[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String description = '';
        String deadline = '';

        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  description = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Deadline'),
                onChanged: (value) {
                  deadline = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Task task = Task(
                  title: title,
                  description: description,
                  deadline: deadline,
                );
                _addTask(task);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class Task {
  final String title;
  final String description;
  final String deadline;

  Task(
      {required this.title, required this.description, required this.deadline});
}
