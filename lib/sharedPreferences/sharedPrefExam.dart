import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../loginScrreen.dart';

class SharedPrefExam extends StatefulWidget {
  @override
  _SharedPrefExamState createState() => _SharedPrefExamState();
}

class _SharedPrefExamState extends State<SharedPrefExam> {
  String _randomNumber = ' ';
  String _savedRandomNumber = ' ';

  void generateRandomNumber() {
    var random = new Random();
    int randomNumber = random.nextInt(1000000000);
    setState(() {
      _randomNumber = randomNumber.toString();
      _savedRandomNumber = _randomNumber;
    });
  }

  loadRandomNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _randomNumber = prefs.getString('randomNumber') ?? 0;
      _savedRandomNumber = _randomNumber;
      print('Saved random number: $_randomNumber');
    });
  }

  saveRandomNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedRandomNumber = (' ');
      prefs.setString('randomNumber', _randomNumber);
      print('Saving random number: $_randomNumber');
    });
  }

  // removeRandomNumber() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove(_randomNumber);
  //   print('Removed random number: $_randomNumber');
  //   return;
  // }

  Widget display() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You have generated random number: '),
          Text(
            _randomNumber,
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(height: 5),
          Text('You saved this number in SharedPreference '),
          Text(
            '$_savedRandomNumber',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget threeButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {
              // print("Pressed Load");
              loadRandomNumber();
            },
            child: Text('Load'),
          ),
          OutlinedButton(
            onPressed: () {
              // print("Pressed Random");
              generateRandomNumber();
            },
            child: Text('Random'),
          ),
          OutlinedButton(
            onPressed: () {
              // print("Pressed Save");
              saveRandomNumber();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget twoButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {
              // print("Pressed Load");
              loadRandomNumber();
            },
            child: Text('Load from SQlite'),
          ),
          OutlinedButton(
            onPressed: () {
              // print("Pressed Random");
              generateRandomNumber();
            },
            child: Text('Save to SQlite'),
          ),
        ],
      ),
    );
  }

  Widget logoutBtn() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: OutlineButton(
        onPressed: () {
          {
            print("Validated");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()));
          }
        },
        child: Text(
          'LOGOUT',
        ),
      ),
    );
  }

  Widget lab11() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          display(),
          threeButtons(),
          twoButtons(),
          SizedBox(height: 100),
          logoutBtn(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
        backgroundColor: Color(0xff185a37),
      ),
      body: lab11(),
    );
  }
}
