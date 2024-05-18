import 'package:flutter/material.dart';
import 'package:flutter_examen_1/models/book.dart';
import 'package:flutter_examen_1/services/book_service.dart';

class BookDetailScreen extends StatelessWidget {
  final int index;

  BookDetailScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: BookService.getBooks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text('Loading...')),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          final book = snapshot.data![index];
          return Scaffold(
            appBar: AppBar(title: Text(book.title)),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Villains:',
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(height: 8.0),
                  ...book.villains
                      .map((villain) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(villain.name,
                                style: Theme.of(context).textTheme.bodyText1),
                          ))
                      .toList(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
