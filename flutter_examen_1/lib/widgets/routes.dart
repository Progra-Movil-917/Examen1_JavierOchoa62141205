import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_examen_1/screens/book_list_screen.dart';
import 'screens/book_detail_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BookListScreen(),
    ),
    GoRoute(
      path: '/book/:index',
      builder: (context, state) {
        final index = int.parse(state.params['index']!);
        return BookDetailScreen(index: index);
      },
    ),
  ],
);
