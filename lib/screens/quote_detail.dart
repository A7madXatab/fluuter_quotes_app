import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';
import '../widgets/text.dart';


class QuoteDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quoteId= ModalRoute.of(context).settings.arguments as String;
    final quote= Provider.of<Quotes>(context, listen: false).find(quoteId);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(quote.author),
      ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  child: Label(quote.author, style: Theme.of(context).textTheme.title,),
                ),
                Expanded(
                  child: Hero(
                      tag: quote.id,
                      child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Label(quote.quote),
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white,),
            onPressed: () async {
              Navigator.of(context).pop();
              Provider.of<Quotes>(context, listen: false).deleteWhere(quote.id);
            },
          ),
    );
  }
}