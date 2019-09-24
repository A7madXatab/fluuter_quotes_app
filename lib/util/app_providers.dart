import 'package:provider/provider.dart';

import '../providers/quotes.dart';
import '../providers/authors.dart';

final List<SingleChildCloneableWidget> providers = [
  ChangeNotifierProvider.value(
    value: Quotes(),
  ),
  ChangeNotifierProvider.value(
    value: Authors(),
  )
];
