import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './text.dart';

class QuoteListItem extends StatelessWidget {
  final String quote;
  final Function onPress;
  final String author;
  final String id;
  final DateTime date;

  QuoteListItem({
    @required this.id,
    @required this.quote, 
    @required this.author, 
    @required this.onPress,
    this.date
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onPress(id),
          child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: Hero(
                    tag: id,
                    child: Label(
                    this.quote,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          
                Label(
                DateFormat.yMMMEd().format(date),
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
              ), Label(
                this.author,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
              ),
              
                ],
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
