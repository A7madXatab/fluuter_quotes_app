import 'package:flutter/material.dart';

import './quotes.dart';
import './authors.dart';

import '../util/navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activePageIndex = 0;
  bool isSearching= false;
  final searchTermController= TextEditingController();

  final List<Widget> _tabs = [QuotesScreen(), AuthorsScreen()];

  void _changeActiveTab(int index) {
    setState(() {
      _activePageIndex = index;
    });
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: <Widget>[
        IconButton(
          icon: const Icon(Icons.format_quote),
          onPressed: () => this._changeActiveTab(0),
        ),
        IconButton(
          icon: const Icon(Icons.group),
          onPressed: () => this._changeActiveTab(1),
        )
      ],
    );
  }

  void _updateSearchTerm(String value) {

  }

  Widget buildTextField() {
    if(isSearching) {
      return Container(
        width: 50,
              child: TextField(
          onChanged: this._updateSearchTerm,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
        ),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: TabBarView(
          children: _tabs,
        ),
        appBar: AppBar(
          title: const Text('Quotes', style: TextStyle(
            fontFamily: 'Livvic',
            fontSize: 25  ,
            fontWeight: FontWeight.w700
          ),),
          actions: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                this.buildTextField(),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                     isSearching= true; 
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                )
              ],
            )
          ],
          bottom: this._buildTabBar(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => Navigator.of(context).pushNamed(Navigation.addQuote),
        ),
      ),
    );
  }
}
