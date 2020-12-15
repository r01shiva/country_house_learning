import 'package:flutter/material.dart';

import 'Screens/AllCountries.dart';
import 'Screens/CountryMap.dart';
import 'Screens/Country.dart';

void main() {
  runApp(new MaterialApp(
    home: new AllCountries(),
    routes: {
      CountryMap.routeName: (ctx) => CountryMap(),
      Country.routeName: (ctx)=> Country(),
    },
  ));
}


