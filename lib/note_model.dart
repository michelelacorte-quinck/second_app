class NoteModel {
  final int id;
  final String title;
  final String description;
  bool isFavorite = false;

  NoteModel(this.id, this.title, this.description, {this.isFavorite = false});

  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title, description: $description, isFavorite: $isFavorite}';
  }
}