import 'package:flutter/material.dart';
import 'package:stutner/constants.dart';
import 'package:stutner/pages/notePages/note_details.dart';

class NoteListingScreen extends StatefulWidget {
  const NoteListingScreen({super.key});

  @override
  State<NoteListingScreen> createState() => _NoteListingScreenState();
}

class _NoteListingScreenState extends State<NoteListingScreen> {
  List<Note> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Note'),
      body: ListView.separated(
        itemCount: notes.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container();
        },
        itemBuilder: (context, index) {
          //final note = notes[index];
          return Container(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color.fromARGB(255, 111, 118, 191),
                //color: const Color.fromARGB(255, 111, 118, 191),
              ),
              child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      notes[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notes[index].description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onLongPress: () {}),
            ),
          );
        },
      ),
      drawer: myDrawer,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteDetailsScreen(notes: notes),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Note {
  String title, description;

  Note({
    required this.title,
    required this.description,
  });
}
