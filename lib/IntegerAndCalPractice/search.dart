import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterPractice/IntegerAndCalPractice/calculationLab5.dart';
import 'calculationLab5.dart';

// ignore: camel_case_types
class search extends StatefulWidget {
  final String username;
  const search({Key key, this.username}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

// ignore: camel_case_types
class _searchState extends State<search> {
  final _lab5formKey = GlobalKey<FormState>();

  final firstIntegerHolder = TextEditingController();
  final secondIntegerHolder = TextEditingController();

  void _sendDataToCalculationScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => calculationLab5(
            firstIntegerValue: firstIntegerHolder.text,
            secondIntegerValue: secondIntegerHolder.text,
          ),
        ));
  }

  Widget firstInteger() {
    return (TextFormField(
      // ignore: deprecated_member_use
      controller: firstIntegerHolder,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Enter first Integer",
      ),
      validator: (name) {
        Pattern pattern = r'^[0-9]';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(name))
          return 'invalid';
        else
          return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    ));
  }

  Widget secondInteger() {
    return (TextFormField(
      // ignore: deprecated_member_use
      controller: secondIntegerHolder,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Enter second Integer",
      ),
      validator: (name) {
        Pattern pattern = r'^[0-9]';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(name))
          return 'invalid';
        else
          return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    ));
  }

  // ignore: non_constant_identifier_names
  Widget ProceedBtn() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        //onPressed: () => changeText(),
        onPressed: () {
          if (_lab5formKey.currentState.validate()) {
            print("Validated");
            _sendDataToCalculationScreen(context);
          } else {
            print("Not Validated");
          }
        },
        padding: EdgeInsets.all(15),
        color: Color(0xff185a37),
        child: Text(
          'Proceed',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget lab5() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Form(
          key: _lab5formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              firstInteger(),
              SizedBox(height: 10),
              secondInteger(),
              SizedBox(height: 10),
              ProceedBtn(),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        backgroundColor: Color(0xff185a37),
      ),
      body: lab5(),
    );
  }
}
