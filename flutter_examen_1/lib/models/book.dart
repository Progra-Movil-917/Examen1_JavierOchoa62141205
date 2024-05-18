class Book {
  final int id;
  final int year;
  final String title;
  final String handle;
  final String publisher;
  final String isbn;
  final int pages;
  final List<String> notes;
  final List<Villain> villains;
  final String author; // Agregamos el atributo author

  Book({
    required this.id,
    required this.year,
    required this.title,
    required this.handle,
    required this.publisher,
    required this.isbn,
    required this.pages,
    required this.notes,
    required this.villains,
    required this.author, // Incluimos el atributo author en el constructor
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      year: json['Year'],
      title: json['Title'],
      handle: json['handle'],
      publisher: json['Publisher'],
      isbn: json['ISBN'],
      pages: json['Pages'],
      notes: List<String>.from(json['Notes'] ?? []),
      villains: (json['villains'] as List<dynamic>)
          .map((villainJson) => Villain.fromJson(villainJson))
          .toList(),
      author: json['Author'], // Asignamos el valor del atributo author
    );
  }
}
