class Book {
  final String title;
  final List<Villain> villains;

  Book({required this.title, required this.villains});

  factory Book.fromJson(Map<String, dynamic> json) {
    var villainsFromJson = json['villains'] as List;
    List<Villain> villainsList =
        villainsFromJson.map((i) => Villain.fromJson(i)).toList();

    return Book(
      title: json['title'],
      villains: villainsList,
    );
  }
}
