import 'package:flutter/material.dart';
import 'package:flutter_tip_calculator/providers/theme_provider.dart';
import 'package:flutter_tip_calculator/providers/tip_calculator_provider.dart';
import 'package:flutter_tip_calculator/widgets/bill_amount.dart';
import 'package:flutter_tip_calculator/widgets/person_counter.dart';
import 'package:flutter_tip_calculator/widgets/tip_row.dart';
import 'package:flutter_tip_calculator/widgets/tip_slider.dart';
import 'package:flutter_tip_calculator/widgets/total_per_person.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool _toggleValue = false;

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<TipCalculatorModel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    var theme = Theme.of(context);

    var style = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );

    return MaterialApp(
      title: "UTip",
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      //   useMaterial3: true,
      // ),
      theme: themeProvider.currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("UTip"),
          actions: [
            Switch(
              value: (themeProvider.isDarkMode),
              onChanged: (onChanged) {
                themeProvider.toggelTheme();
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TotalPerPerson(style: style, billT: model.billPerPerson, theme: theme),

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
                            amount: model.billTotal.toString(),
                            onChanged: (value) {
                              print("Bill amount changed: $value");
                              model.updateBillTotal(double.tryParse(value) ?? 0.0);
                              // setState(() {
                              //   _billTotal = double.tryParse(value) ?? 0.0;
                              // });
                            },
                          ),

                          //spaces
                          SizedBox(height: 20),
                          //split bill widget
                          PersonCount(
                            theme: theme,
                            onDecrement: (){
                              if(model.personCount > 1){
                                model.updatePersonCount(model.personCount - 1);
                              }
                            },
                            onIncrement: (){
                              model.updatePersonCount(model.personCount + 1);
                            },
                            personCount: model.personCount,
                          ),

                          //Pin widget
                          TipRow(theme: theme, totalT: (model.billTotal * model.tipPercentage)),

                          SizedBox(height: 5),

                          //Slider for tip percentage
                          Center(
                            child: Text(
                              "${(model.tipPercentage * 100).toInt()}%",
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),

                          TipSlider(
                            tipPercentage: model.tipPercentage,
                            onChanged: (value) {
                              // setState(() {
                              //   _tipPercentage = value;
                              // });

                              model.updateTipPercentage(value);

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



