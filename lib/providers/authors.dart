import 'dart:io';

import 'package:flutter/material.dart';

import '../util/database.dart';
import '../models/quote.dart';
import '../models/author.dart';

class Authors with ChangeNotifier {
  List<Author> _authors = [];

  List<Author> get authors {
    return [..._authors];
  }

  Future<void> init() async {
    final authors = await Quotes.authors();

    _authors = authors.map((author) => Author(author['author'])).toList();

    notifyListeners();
  }

  Author find(authorName) {
    final author =
        _authors.firstWhere((a) => a.name == authorName, orElse: () => null);

    return author;
  }

  Future<List<Quote>> quotesOf(String author) async {
    final authorQuotes = await Quotes.quotesOf(author);

    List<Quote> quotes = authorQuotes
        .map(
          (quote) => Quote(
            author: quote['author'],
            id: quote['id'],
            quote: quote['quote'],
            time: DateTime.parse(quote['date']),
            imageFile: quote['image'] == null ? null : File(quote['image']),
          ),
        )
        .toList();

    return quotes;
  }
}
