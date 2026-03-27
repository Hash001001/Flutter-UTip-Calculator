import 'package:flutter/material.dart';

void main() {
  runApp(MyHome());
}


class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  bool _toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UTip",
      home: Scaffold(
        appBar: AppBar(
          title: Text("UTip"),
          actions: [
            Switch(
              value: (_toggleValue), onChanged: (onChanged){
              setState(() {
                _toggleValue = onChanged;
              });
            })
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(6)
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Total Per Person", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                    Text("", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)

                  ],
                ),
              ),
),


Expanded(child: Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
    decoration: BoxDecoration(
      border: BoxBorder.all(color: Colors.purple.withOpacity(0.6), width: 1.5),
      borderRadius: BorderRadius.circular(6)
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
      
  
            onChanged: (value){

            },

            decoration: InputDecoration(
            
              label: Text("Bill Amount"), border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
          )
        ],
      
      ),
    )
  ),
),)

          ],
        ),
      ),
    );
  }
}