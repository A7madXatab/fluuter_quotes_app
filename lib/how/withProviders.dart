import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/app_providers.dart';

final Function withProviders = ({Widget child}) {
     return MultiProvider(
      providers: providers, 
      child: child,
    );
};