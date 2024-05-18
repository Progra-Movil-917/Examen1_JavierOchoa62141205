import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_service.dart';

class BookListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stephen King Books')),
      body: FutureBuilder<List<Book>>(
        future: BookService.getBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final books = snapshot.data!;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(book.title,
                        style: Theme.of(context).textTheme.headline1),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.pushNamed(context, '/bookDetails',
                          arguments: book);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
