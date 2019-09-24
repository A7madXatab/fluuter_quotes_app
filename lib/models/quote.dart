import 'dart:io';

import 'package:flutter/foundation.dart';

class Quote {
  final String id;
  final String quote;
  final String author;
  final DateTime time;
  final File imageFile;

  Quote({
    @required this.id,
    @required this.author,
    @required this.quote,
    @required this.time,
    this.imageFile
  });
}
