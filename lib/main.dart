import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/favorite_screen.dart';
import 'package:second_app/note_widget.dart';
import 'package:second_app/routes.dart';

import 'notes_provider.dart';

void main() {
  runApp(
    // Provider configs
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App Routes configs
      routes: appRoutes,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: notesProvider.notes.length,
        itemBuilder: (context, index) {
          return NoteWidget(note: notesProvider.notes[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(FavoriteScreen.routeName),
        tooltip: 'Favorite',
        child: const Icon(Icons.favorite),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
