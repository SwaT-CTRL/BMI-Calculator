import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.brown),
    home: const MyHomePage()));

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double age = 0.0;
  // ignore: prefer_typing_uninitialized_variables
  var selectedYear;

  var selected;

  Object get selectedDate => '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  void _showPicker() {
    showDatePicker(
            context: context,
            firstDate: new DateTime(1900),
            initialDate: new DateTime(2018),
            lastDate: DateTime.now())
        .then((DateTime) {
      selectedYear = DateTime?.year;
      calculateAge();
    });
  }

// To Change the Value of state on click
  void calculateAge() {
    setState(() {
      age = (2022 - selectedYear).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calculator"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new OutlinedButton(
              onPressed: _showPicker,
              child: new Text(selectedYear != null
                  ? selectedYear.toString()
                  : "Please Select Your Birth Date"),
            ),
            new Padding(
              padding: EdgeInsets.all(20.0),
            ),
            new Text(
              "Your Age is ${age.toStringAsFixed(0)}",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
