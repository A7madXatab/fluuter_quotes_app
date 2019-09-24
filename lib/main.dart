import 'package:flutter/material.dart';

import './util/navigation.dart';
import './util/app_theme.dart';
import './how/withProviders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return withProviders(
        child: MaterialApp(
      title: 'Quotes',
      theme: appTheme,
      routes: Navigation.routes,
    ));
  }
}
