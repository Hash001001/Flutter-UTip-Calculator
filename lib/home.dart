import 'package:flutter/material.dart';
import 'package:flutter_tip_calculator/widgets/person_counter.dart';
import 'package:flutter_tip_calculator/widgets/tip_slider.dart';

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

  void _incrementPersonCount() {
    setState(() {
      _personCount++;
    });
  }

  void _decrementPersonCount() {
    setState(() {
      if (_personCount > 0) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
            Padding(
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
                      "\$230",
                      style: style.copyWith(
                        fontSize: 25,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
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
                      TextField(
                        controller: _textController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},

                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: theme.colorScheme.primary,
                          ),
                          label: Text("Bill Amount"),
                          border: OutlineInputBorder(),
                        ),
                      ),

                      //spaces
                      SizedBox(height: 20),
                      //split bill widget
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Split",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          PersonCount(
                            theme: theme,
                            onDecrement: _decrementPersonCount,
                            onIncrement: _incrementPersonCount,
                            personCount: _personCount,
                          ),
                        ],
                      ),

                      //Pin widget
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tip",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "\$20",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),


SizedBox(height: 5,),

                      //Slider for tip percentage

                      Center(
                        child: Text("${(_tipPercentage * 100).toInt()}%", style: theme.textTheme.titleMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              
                              ),),
                      ),

                      TipSlider(tipPercentage: _tipPercentage, onChanged: (value) {

                        setState(() {
                          _tipPercentage = value;
                        });
                      }),
                    ],
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


