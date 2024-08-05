import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate Your BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int myHeight = 0;
  int myWeight = 0;

  @override
  Widget build(BuildContext context) {

    TextField heightField = TextField(
      decoration: InputDecoration(
          labelText: "Height (cm)",
          hintText: "Enter your height..."
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          myHeight = int.parse(value);
        } catch (exception) {
          myHeight = 0;
        }
      },
    );

    TextField weightField = TextField(
      decoration: InputDecoration(
          labelText: "Weight (kg)",
          hintText: "Enter your weight..."
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          myWeight = int.parse(value);
        } catch (exception) {
          myWeight = 0;
        }
      },
    );

    ElevatedButton calculateButton = ElevatedButton(
      child: Text("Calculate"),
      onPressed: () {
        double h = myHeight / 100;
        double total = myWeight / (h * h);
        String result = total.toStringAsFixed(2);

        String msg = "";

        if (total < 18.5) {
          msg = "Underweight";
        } else if (total >= 18.5 && total <= 24.9) {
          msg = "Normal weight";
        } else if (total >= 25 && total <= 29.9) {
          msg = "Overweight";
        } else {
          msg = "Obesity";
        }

        AlertDialog dialog = AlertDialog(
            content: Text("BMI: $result \nResult: $msg")
        );

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog;
            }
        );
      },
    );

    Container container = Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [heightField, weightField, calculateButton]
        )
    );

    AppBar appBar = AppBar(title: Text("Calculate Your BMI"));
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    return scaffold;
  }
}
