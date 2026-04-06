
import 'package:flutter/material.dart';
import 'package:flutter_tip_calculator/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeButtonWidget extends StatelessWidget {
  const ThemeButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(onPressed: (){
      themeProvider.toggelTheme();
    }, icon: themeProvider.isDarkMode ? Icon(Icons.dark_mode) :  Icon(Icons.light_mode));
  }
}