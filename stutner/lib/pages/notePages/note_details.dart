import 'package:flutter/material.dart';
import 'package:stutner/constants.dart';
import 'package:stutner/pages/notePages/note_taking.dart';

class NoteDetailsScreen extends StatefulWidget {
  final List<Note> notes;

  const NoteDetailsScreen({Key? key, required this.notes}) : super(key: key);

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  final GlobalKey<FormState> _formValidationKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  //List<Note> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Note Details'),
      body: Form(
        key: _formValidationKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Enter tittle',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
                suffixIcon: Icon(Icons.text_fields_rounded),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Please enter a tittle.';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              controller: _descriptionController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Enter description',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
                suffixIcon: Icon(Icons.description_rounded),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Please enter a description.';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formValidationKey.currentState!.validate()) {
                  widget.notes.add(Note(
                    title: _titleController.text.trim(),
                    description: _descriptionController.text.trim(),
                  ));
                  if (mounted) {
                    setState(() {});
                  }
                  Navigator.pop(context);
                }
              },
              child: Text('Save task'),
              style: ButtonStyle(elevation: MaterialStateProperty.all(6)),
            )
          ],
        ),
      ),
    );
  }
}
