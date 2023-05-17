import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note_widget.dart';
import 'notes_provider.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = "/favorites";

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Listen true vs Listen false !!!
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: ListView.builder(
        itemCount: notesProvider.getFavorites().length,
        itemBuilder: (context, index) {
          return NoteWidget(note: notesProvider.getFavorites()[index]);
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
