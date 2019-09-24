import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/authors.dart';
import '../models/quote.dart';
import '../widgets/text.dart';
import '../widgets/quote_list.dart';

class AuthorQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final author = ModalRoute.of(context).settings.arguments as String;

    final provider = Provider.of<Authors>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: FittedBox(
        fit: BoxFit.none,
        child: Label(
          'Quotes By $author',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      )),
      body: FutureBuilder(
        future: provider.quotesOf(author),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final authorQuotes = dataSnapshot.data as List<Quote>;

          return QuoteList(
            authorQuotes,
            isSingleAuthor: true,
          );
        },
      ),
    );
  }
}
