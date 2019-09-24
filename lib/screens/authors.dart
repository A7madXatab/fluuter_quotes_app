import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/authors.dart';
import '../widgets/authors_list.dart';

class AuthorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final provider= Provider.of<Authors>(context, listen: false);

    return FutureBuilder(
      future: provider.init(),
      builder: (context, dataSnapshot) {
        if(dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Consumer<Authors>(
          builder: (ctx, authors, _) {
            return AuthorsList(authors.authors);
          },
        );
      },
    );
  }
}