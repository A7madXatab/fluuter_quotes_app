import 'dart:io';

import 'package:flutter/material.dart';

import '../util/database.dart' as db;
import '../util/invalid_enjection_exception.dart';
import '../models/quote.dart';


class Quotes with ChangeNotifier {
  List<Quote> _quotes= [];

  List<Quote> get quotes {
    return [..._quotes];
  }

  Future<void> add(Quote quote) async {
    _quotes.add(quote);

    try {
        await db.Quotes.insert('quotes', {
      'id': quote.time.toString(),
      'quote': quote.quote,
      'author': quote.author,
      'date': quote.time.toIso8601String(),
      'image': quote.imageFile == null ? '' : quote.imageFile.path
    });
    } on InvalidDataInjection catch(err) {
      throw InvalidDataInjection('error happend while inserting new quote');
    }
  }

  Future<void> init() async {
    final quotes= await db.Quotes.all();

    _quotes= quotes.map((data) => Quote(
      id: data['id'].toString(),
      author: data['author'],
      quote: data['quote'],
      time: DateTime.parse(data['date']),
      imageFile: data['image'] == null ? null : File(data['image'])
    )).toList();

    notifyListeners();
  }

  Future<void> deleteWhere(String id)async {
    try {
      await db.Quotes.deleteWhere(id);
      _quotes= _quotes.where((q) => q.id != id).toList();
      notifyListeners();
    } catch(e) {
      print('err');
    }
  }

  Quote find(id) {
    final quote= _quotes.firstWhere((q) => q.id == id, orElse: () => null);

    return quote;
  }
}