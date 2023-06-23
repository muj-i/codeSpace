import 'package:flutter/material.dart';

void main() {
  runApp(ThemeSwitchApp());
}

class ThemeSwitchApp extends StatefulWidget {
  @override
  _ThemeSwitchAppState createState() => _ThemeSwitchAppState();
}

class _ThemeSwitchAppState extends State<ThemeSwitchApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  List<ToDo> todoList = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isTrue = false;

  void editTodoItem(int index) {
    // Get the existing todo item
    ToDo existingTodo = todoList[index];

    // Create controllers for the title and description
    TextEditingController editTitleController =
        TextEditingController(text: existingTodo.title);
    TextEditingController editDescriptionController =
        TextEditingController(text: existingTodo.desc);

    // Create a variable to track the acceptance of terms

    // Show a dialog to edit the todo item
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Todo Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: editTitleController,
              decoration: buildInputDecoration(
                hint: 'Title',
                label: 'Title',
                contentPadding: 20,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: editDescriptionController,
              decoration: buildInputDecoration(
                hint: 'Description',
                label: 'Description',
                contentPadding: 50,
              ),
            ),
            CheckboxListTile(
              title: Text('Accept all terms & conditions'),
              value: isTrue,
              onChanged: (value) {
                isTrue = !isTrue;
                todoList[index] = ToDo(
                  title: editTitleController.text.trim(),
                  desc: editDescriptionController.text.trim(),
                  isDone: isTrue,
                );
                if (mounted) {
                  setState(() {
                    Navigator.pop(context);
                    editTodoItem(index);
                  });
                }
                print(isTrue);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Update the existing todo item
              todoList[index] = ToDo(
                title: editTitleController.text.trim(),
                desc: editDescriptionController.text.trim(),
                isDone: isTrue,
              );

              // Clear the controllers
              editTitleController.clear();
              editDescriptionController.clear();

              // Close the dialog
              Navigator.of(context).pop();
              // Trigger a rebuild of the UI
              setState(() {});
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('To Do App'),
            actions: [
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  toggleTheme();
                },
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(todoList[index].title.toString()),
              subtitle: Text(todoList[index].desc.toString()),
              leading: todoList[index].isDone
                  ? Icon(Icons.done)
                  : Icon(Icons.downloading_outlined),
              trailing: FittedBox(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        editTodoItem(index);
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        todoList.removeAt(index);
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottom();
            },
            child: Icon(Icons.add),
          ),
        ));
  }

  showModalBottom() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              'Add Todo Task',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: titleController,
              decoration: buildInputDecoration(
                  hint: 'Title', label: 'Title', contentPadding: 20),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: descriptionController,
              decoration: buildInputDecoration(
                  hint: 'Description',
                  label: 'Description',
                  contentPadding: 50),
            ),
            CheckboxListTile(
              title: Text('Accept all tearms & conditions'),
              value: isTrue,
              onChanged: (value) {
                setState(() {
                  isTrue = !isTrue;
                  Navigator.pop(context);
                  showModalBottom();
                });
                print(isTrue);
              },
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.trim().isNotEmpty &&
                      descriptionController.text.trim().isNotEmpty) {
                    todoList.add(ToDo(
                        title: titleController.text.trim(),
                        desc: descriptionController.text.trim(),
                        isDone: isTrue));
                  }
                  if (mounted) {
                    setState(() {});
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add ToDo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToDo {
  final String title;
  final String desc;
  final bool isDone;

  ToDo({
    required this.isDone,
    required this.title,
    required this.desc,
  });
}

InputDecoration buildInputDecoration(
    {hint, label, required double contentPadding}) {
  return InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: contentPadding, horizontal: 20.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    hintText: hint,
    labelText: label,
  );
}

class DarkMode {
  static bool isDarkMode = false;
}
