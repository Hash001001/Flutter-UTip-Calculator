import 'package:flutter/material.dart';

class PersonCount extends StatelessWidget {
  const PersonCount({
    super.key,
    required this.theme,
    required this.onDecrement,
    required this.onIncrement,
    required int personCount,
  }) : _personCount = personCount;

  final ThemeData theme;
  final int _personCount;

  final void Function() onDecrement; 
  final void Function() onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          color: theme.colorScheme.primary, onPressed: onDecrement,
        ),
    
        Text(
          "$_personCount",
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
    
        IconButton(
          icon: Icon(Icons.add),
          color: theme.colorScheme.primary, onPressed: onIncrement,
        ),
      ],
    );
  }
}
