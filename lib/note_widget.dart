import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/notes_provider.dart';

import 'note_model.dart';

class NoteWidget extends StatefulWidget {
  final NoteModel note;

  const NoteWidget({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context, listen: true);

    return InkWell(
      onLongPress: () {
        notesProvider.toggleFavorite(widget.note.id);
      },
      child: ListTile(
        title: Text(widget.note.title),
        subtitle: Text(widget.note.description),
        trailing: widget.note.isFavorite
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border_outlined),
      ),
    );
  }
}
