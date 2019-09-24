import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';
import '../models/quote.dart';

class AddQuoteScreen extends StatefulWidget {
  @override
  _AddQuoteScreenState createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  final _authorNameController= TextEditingController();
  final _quoteController= TextEditingController();

  void _add() async{
    if(_authorNameController.text.isEmpty || _quoteController.text.isEmpty)
      return;

    final now= DateTime.now();
    Quote quote= Quote(
      id: now.toIso8601String(),
      author: _authorNameController.text,
      quote: _quoteController.text,
      time: now,
      imageFile: null
    );

    try {
      await Provider.of<Quotes>(context, listen: false).add(quote);
      Navigator.of(context).pop();
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Quote'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: 
           SingleChildScrollView(
             child: Column(
             children: <Widget>[
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                 child: TextField(
                   controller: _authorNameController,
                   decoration: InputDecoration(
                     labelText: 'Author Name',
                     enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(5,))
                   ),
                 ),
               ),
                Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                 child: TextField(
                   maxLines: 10,
                    minLines: 1,
                   controller: _quoteController,
                   decoration: InputDecoration(
                     labelText: 'Quote ""',
                      alignLabelWithHint: false,
                     enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(5,))
                   ),
                 ),
               )
             ],
          ),
           )),
          Container(
            width: double.infinity,
            child: MaterialButton(
            onPressed: this._add,
            color: Theme.of(context).buttonColor,
            child: const Text('Add', style: TextStyle(color: Colors.white),),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          )
        ],
      ),
    );
  }
}