import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///Created on Android Studio Canary Version
///User: Gagandeep
///Date: 02-05-2019
///Time: 13:05
///Project Name: body_mass_index_app


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  var messageString = "Calculate BMI";
  var bmiColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Image.asset(
              'images/bmi.png',
              height: 200.0,
              width: 200.0,
              color: Colors.blue,
            ),  //Image
            TextField(
              keyboardType: TextInputType.number,
              controller: _ageController,
              decoration: InputDecoration(
                icon: Icon(Icons.person_outline),
                hintText: "Age",
                labelText: "Age"
              ),
            ),  //Age
            TextField(
              keyboardType: TextInputType.number,
              controller: _heightController,
              decoration: InputDecoration(
                icon: Icon(Icons.timeline),
                hintText: "Height in Metre",
                labelText: "Height"
              ),
            ),  //Height (m)
            TextField(
              keyboardType: TextInputType.number,
              controller: _weightController,
              decoration: InputDecoration(
                icon: Icon(Icons.line_weight),
                hintText: "Weight in KGs",
                labelText: "Weight"
              ),
            ),  //Weight (kg)
            Padding(padding: EdgeInsets.all(16.0)),
            RaisedButton(
              onPressed: () {
                calculateBMI();
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Calculate"),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Center(
              child: Text(
                "$messageString",
                style: TextStyle(
                  fontSize: 19.4,
                  fontWeight: FontWeight.w600,
                  color: bmiColor
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  void calculateBMI() {

     //weight (lb) ÷ height2 (in2) × 703
    setState(() {
      if(_ageController.text.isEmpty)
        messageString = "Enter Age";
      else if(_heightController.text.isEmpty)
        messageString = "Enter Height";
      else if(_weightController.text.isEmpty)
        messageString = "Enter Weight";
      else{
        num height = double.parse(_heightController.text);
        num weight = double.parse(_weightController.text);
        num bmi = (weight/(height*height));
        messageString = "Your BMI is ${bmi.toStringAsFixed(2)}";
        //yellow,green, oragne, red
        if(bmi <= 18.5 )
          bmiColor = Colors.yellow;
        else if(bmi <= 24.9 )
          bmiColor = Colors.green;
        else if(bmi <= 29.9 )
          bmiColor = Colors.deepOrangeAccent;
        else
          bmiColor = Colors.red;
      }
    });
  }
}


