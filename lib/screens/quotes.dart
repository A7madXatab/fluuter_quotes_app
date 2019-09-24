import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';
import '../models/quote.dart';
import '../widgets/quote_list.dart';

class QuotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quotes = Provider.of<Quotes>(context, listen: false);

    return FutureBuilder(
      future: quotes.init(),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Consumer<Quotes>(
          builder: (ctx, quotes, _) {
            final List<Quote> q= quotes.quotes;
            return QuoteList(q);
          },
        );
      },
    );
  }
}
