import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  List<Todo> todos = [];

  late ThemeData _currentTheme;

  @override
  void initState() {
    super.initState();
    _currentTheme = ThemeData.light();
  }

  void _toggleTheme() {
    setState(() {
      if (_currentTheme == ThemeData.light()) {
        _currentTheme = ThemeData.dark();
      } else {
        _currentTheme = ThemeData.light();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 22,
        title: const Text('Home'),
        actions: [
          IconButton(
              icon: Icon(Icons.lightbulb_outline), onPressed: _toggleTheme),
          IconButton(
            onPressed: () {
              if (todos.isEmpty) {
///////////////
                print('emty');
/////////////////
              } else {
                MyAletrtDialog(context);
              }
            },
            icon: const Icon(Icons.highlight_remove),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: todos[index].isDone
                  ? const Color.fromARGB(255, 3, 73, 39)
                  : Colors.redAccent,
            ),
            child: ListTile(
              onLongPress: () {
                todos[index].isDone = !todos[index].isDone;
                if (mounted) {
                  setState(() {});
                }
              },
              title: Text(todos[index].title),
              subtitle: Text(
                todos[index].description,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _titleTEController.text = todos[index].title;
                      _descriptionTEController.text = todos[index].description;

                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Edit Todo',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _titleTEController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Title',
                                      hintText: 'Title',
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _descriptionTEController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Description',
                                      hintText: 'Description',
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_titleTEController.text
                                            .trim()
                                            .isNotEmpty &&
                                        _descriptionTEController.text
                                            .trim()
                                            .isNotEmpty) {
                                      todos[index].title =
                                          _titleTEController.text.trim();
                                      todos[index].description =
                                          _descriptionTEController.text.trim();
                                      if (mounted) {
                                        setState(() {});
                                      }
                                      _titleTEController.clear();
                                      _descriptionTEController.clear();
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text('Edit Todo'),
                                )
                              ],
                            ),
                          );
                          //     return Container(
                          //       height: 200,
                          //       child: Center(
                          //         child: Text('Bottom Modal Sheet'),
                          //       ),
                          //     );
                        },
                      );
                    },
                    child: Icon(Icons.edit),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      todos.removeAt(index);
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddNewTodoModalSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddNewTodoModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Add New Todo',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _titleTEController,
                    decoration: InputDecoration(
                      labelText: 'Enter Title',
                      hintText: 'Title',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _descriptionTEController,
                    decoration: InputDecoration(
                      labelText: 'Enter Description',
                      hintText: 'Description',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_titleTEController.text.trim().isNotEmpty &&
                        _descriptionTEController.text.trim().isNotEmpty) {
                      todos.add(Todo(_titleTEController.text.trim(),
                          _descriptionTEController.text.trim(), false));
                      if (mounted) {
                        setState(() {});
                      }
                      _titleTEController.clear();
                      _descriptionTEController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add'),
                )
              ],
            ),
          );
        });
  }

  MyAletrtDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: Text('Do you want to delete permanently?'),
            actions: [
              TextButton(
                  onPressed: () {
                    todos.clear();
                    if (mounted) {
                      setState(() {});
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
            ],
          ));
        });
  }
}

// To do
// title, description, done

class Todo {
  String title, description;
  bool isDone;

  Todo(this.title, this.description, this.isDone);
}
