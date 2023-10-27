import 'package:flutter/material.dart';

List<String> CurrencyA = ["EGP", "USD", "EUR"];
List<String> CurrencyB = ["EGP", "USD", "EUR"];
String myvalue1 = CurrencyA.first;
String myvalue2 = CurrencyB.first;
String Value = "";
double myvalue = 0;

void main() {
  runApp(const MaterialApp(
    title: "CurrencyExchangeApp",
    home: ExchangeApp(),
  ));
}



class ExchangeApp extends StatefulWidget {
  const ExchangeApp({super.key});

  @override
  State<ExchangeApp> createState() => _ExchangeAppState();
}

class _ExchangeAppState extends State<ExchangeApp> {

  double Calculate() {
    double input = double.parse(Value);
    double output;
    if (myvalue1 == "EGP") {
      if (myvalue2 == "USD") {
        output = input / 30;
      } else if (myvalue2 == "EUR"){
        output = input / 33;
      } else {
        output = input;
      }
    } else if (myvalue1 == "USD") {
      if (myvalue2 == "EGP") {
        output = input * 30;
      } else if (myvalue2 == "EUR"){
        output = input * 0.94;
      } else {
        output = input;
      }
    } else {
      if (myvalue2 == "EGP") {
        output = input * 33;
      } else if (myvalue2 == "USD"){
        output = input / 0.94;
      } else {
        output = input;
      }
    }

    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Change your Currency Today!",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'assets/${myvalue1}.png',
            ),
            DropdownButton(
              items: CurrencyA.map((String Value) {
                return DropdownMenuItem(
                  value: Value,
                  child: Text(Value),
                );
              }).toList(),
              value: myvalue1,
              onChanged: (String? Value) {
                setState(() {
                  myvalue1 = Value!;
                });
              }),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter the Value",
                  border: OutlineInputBorder(),
                ),
                onChanged: (Val) {
                  setState(() {
                    Value = Val;
                  });
                },
              ),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(items: CurrencyB.map((String Value) {
                  return DropdownMenuItem(
                  value: Value,
                  child: Text(Value),
                  );
                }).toList(),
                  value: myvalue2,
                  onChanged: (String? Value) {
                    setState(() {
                      myvalue2 = Value!;
                     });
                  }),
                IconButton(onPressed: () {
                  setState(() {
                    myvalue = Calculate();
                  });
                },
                  icon: Icon(Icons.calculate_rounded)),
              ],
            ),
            Container (
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 2,
                ),
              ),
              width: 200,
              height: 60,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              child: Text("${myvalue}"),
            ),
            Image.network(
              'assets/${myvalue2}.png',
            ),
          ],
        ),
      ),
    );
  }
}

