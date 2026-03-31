import 'package:flutter/material.dart';
import 'package:flutter_tip_calculator/widgets/bill_amount.dart';
import 'package:flutter_tip_calculator/widgets/person_counter.dart';
import 'package:flutter_tip_calculator/widgets/tip_row.dart';
import 'package:flutter_tip_calculator/widgets/tip_slider.dart';
import 'package:flutter_tip_calculator/widgets/total_per_person.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool _toggleValue = false;

  final _textController = TextEditingController();

  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;
  double _totalTip = 0.0;

double _tipAmount(){
  return ((_billTotal * _tipPercentage));
}

  double billPerPerson(){
    return ((_billTotal * _tipPercentage) + (_billTotal) / _personCount);
  }

  void _incrementPersonCount() {
    setState(() {
      _personCount++;
    });
  }

  void _decrementPersonCount() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var billT = billPerPerson();
    var totalT = _tipAmount();


    var style = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );

    return MaterialApp(
      title: "UTip",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("UTip"),
          actions: [
            Switch(
              value: (_toggleValue),
              onChanged: (onChanged) {
                setState(() {
                  _toggleValue = onChanged;
                });
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TotalPerPerson(style: style, billT: billT, theme: theme),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: Colors.purple.withOpacity(0.6),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 8),
                          BillAmountField(
                            textController: _textController,
                            theme: theme,
                            amount: _billTotal.toString(),
                            onChanged: (value) {
                              print("Bill amount changed: $value");
                              setState(() {
                                _billTotal = double.tryParse(value) ?? 0.0;
                              });
                            },
                          ),

                          //spaces
                          SizedBox(height: 20),
                          //split bill widget
                          PersonCount(
                            theme: theme,
                            onDecrement: _decrementPersonCount,
                            onIncrement: _incrementPersonCount,
                            personCount: _personCount,
                          ),

                          //Pin widget
                          TipRow(theme: theme, totalT: totalT),

                          SizedBox(height: 5),

                          //Slider for tip percentage
                          Center(
                            child: Text(
                              "${(_tipPercentage * 100).toInt()}%",
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),

                          TipSlider(
                            tipPercentage: _tipPercentage,
                            onChanged: (value) {
                              setState(() {
                                _tipPercentage = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



