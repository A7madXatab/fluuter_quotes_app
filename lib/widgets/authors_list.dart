import 'package:flutter/material.dart';

import '../util/custom_transition.dart';
import '../screens/author_quotes.dart';
import '../models/author.dart';

class AuthorsList extends StatelessWidget {
  final List<Author> authors;

  AuthorsList(this.authors);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: authors.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          onTap: () => Navigator.push(
            context,
            CustomRoute(
              builder: (ctx) => AuthorQuotes(),
              settings: RouteSettings(arguments: authors[index].name),
            ),
          ),
          leading: Text(authors[index].name, style: (Theme.of(context).textTheme.title).merge(TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic
          ))),
        );
      },
    );
  }
}
