import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.style,
    required this.billT,
    required this.theme,
  });

  final TextStyle style;
  final double billT;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple[500]!.withOpacity(0.6),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.all(19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Total Per Person", style: style),
            Text(
              "\$${billT.toStringAsFixed(1)}",
              style: style.copyWith(
                fontSize: 25,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
