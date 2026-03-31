import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercentage, this.onChanged,
  }) : _tipPercentage = tipPercentage;

  final double _tipPercentage;
  final ValueChanged<double>? onChanged;


  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0, max: 1, divisions: 6, 
      label: ("${(_tipPercentage * 100).toInt()}%"),
      value: _tipPercentage, onChanged: onChanged,
    
    );
  }
}