import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key,
    required TextEditingController textController,
    required this.theme, required this.amount, this.onChanged,
  }) : _textController = textController;

  final TextEditingController _textController;
  final ThemeData theme;
  final String amount; 
  final ValueChanged<String>? onChanged;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        onChanged?.call(value);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.attach_money,
          color: theme.colorScheme.primary,
        ),
        label: Text("Bill Amount"),
        border: OutlineInputBorder(),
      ),
    );
  }
}

