import 'package:flutter/material.dart';

import './quote_list_item.dart';
import '../util/navigation.dart';
import '../models/quote.dart';

class QuoteList extends StatelessWidget {
  final List<Quote> quotes;
  final bool isSingleAuthor;

  QuoteList(this.quotes, {this.isSingleAuthor= false});

  void _navigateToDetailsOf(String id, BuildContext context) {
    Navigator.of(context).pushNamed(Navigation.quoteDetail, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (ctx, index) => QuoteListItem(
        date: quotes[index].time,
        id: quotes[index].id,
        author: this.isSingleAuthor ? '' : quotes[index].author,
        quote: quotes[index].quote,
        onPress: (id) => this._navigateToDetailsOf(id, context),
      ),
    );
  }
}
