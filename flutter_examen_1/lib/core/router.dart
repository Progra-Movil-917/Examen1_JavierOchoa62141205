import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_examen_1/screens/book_detail_screen.dart';
import 'package:flutter_examen_1/screens/book_list_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BookListScreen(),
    ),
    GoRoute(
      path: '/bookDetails/:index',
      builder: (context, state) {
        final index = state.params['index'] as int?;
        if (index != null) {
          return BookDetailScreen(index: index);
        } else {
          // Manejar el caso en el que no se pueda obtener el índice de la ruta
          return Container(); // O cualquier otra pantalla o widget apropiado
        }
      },
    ),
  ],
);
