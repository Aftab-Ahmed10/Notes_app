import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.note,
      required this.index,
      required this.onNewNoteDeleted});

  final Note note;
  final int index;

  final Function(int) onNewNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(
                  note: note,
                  index: index,
                  onNewNoteDeleted: onNewNoteDeleted,
                )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                note.body,
                style: const TextStyle(fontSize: 18.0),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
