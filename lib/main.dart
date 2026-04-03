import 'package:flutter/material.dart';
import 'package:flutter_tip_calculator/home.dart';
import 'package:flutter_tip_calculator/providers/theme_provider.dart';
import 'package:flutter_tip_calculator/providers/tip_calculator_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TipCalculatorModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
        ),
      ],

      child: MyHome(),
    ),
  );
}
