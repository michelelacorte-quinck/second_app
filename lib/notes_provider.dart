import 'package:flutter/material.dart';

import 'note_model.dart';

class NotesProvider with ChangeNotifier {
  final List<NoteModel> notes = [];

  void toggleFavorite(int noteId) {
    final note = notes.firstWhere((element) => element.id == noteId);
    note.isFavorite = !note.isFavorite;
    notifyListeners();
  }

  List<NoteModel> getFavorites() {
    return notes.where((element) => element.isFavorite).toList();
  }

  NotesProvider() {
    for(int i = 0; i < 100; i++) {
      notes.add(NoteModel(i, "Title $i", "Description $i"));
    }
  }
}
