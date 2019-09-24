import 'package:flutter/material.dart';

import '../screens/add_quote.dart';
import '../screens/authors.dart';
import '../screens/quotes.dart';
import '../screens/home.dart';
import '../screens/quote_detail.dart';
import '../screens/author_quotes.dart';

class Navigation {
  static const String home= '/';
  static const String quotes= '/quotes';
  static const String authors= '/authores';
  static const String addQuote= '/add-quote';
  static const String quoteDetail= '/quote-detail';
  static const String authorQuotes= 'author-quotes';

  static final Map<String, WidgetBuilder> routes= {
    quotes: (BuildContext context) => QuotesScreen(),
    addQuote: (BuildContext context) => AddQuoteScreen(),
    authors: (BuildContext context) => AuthorsScreen(),
    home: (BuildContext context) => HomeScreen(),
    quoteDetail: (BuildContext context) => QuoteDetail(),
    authorQuotes: (BuildContext context) => AuthorQuotes()
  };
}