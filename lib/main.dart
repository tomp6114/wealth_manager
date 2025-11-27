import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/app.dart';
import 'package:money_manager/flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const App());
}
