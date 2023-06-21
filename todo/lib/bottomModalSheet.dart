import 'package:flutter/material.dart';
import 'home.dart';
void showAddNewTodoModalSheet() {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Add New Todo'),
              TextField(
                controller: _titleTEController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: _descriptionTEController,
                decoration: const InputDecoration(hintText: 'Description'),
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
}