import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../loginScrreen.dart';
import 'randomNumber.dart';
import 'databaseService.dart';

Future main() async {
  DatabaseService();
}

class SharedPrefExam extends StatefulWidget {
  @override
  _SharedPrefExamState createState() => _SharedPrefExamState();
}

class _SharedPrefExamState extends State<SharedPrefExam> {
  DatabaseService dbService = DatabaseService();
  int _randomNumber = 0;
  int _savedRandomNumber = 0;

  int _numberInDatabase = 0;
  int _numberInDatabaseId = 0;
  int _savedNumberInDatabase = 0;

  int _numberInFile = 0;
  int _savedNumberInFile = 0;

  //Finding the correct local path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //Creating a reference to the file location
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/randoms.txt');
  }

  //Writing data to the file
  void _writeNumberToFile() async {
    final file = await _localFile;
    file.writeAsString('$_randomNumber');
    setState(() {
      _numberInFile = _randomNumber;
      _savedNumberInFile = 0;
      print('Writing random number to file: $_numberInFile');
    });
  }

  void _readNumberFromFile() async {
    try {
      final file = await _localFile;
      // Read the file.
      String contents = await file.readAsString();

      setState(() {
        // _randomNumber = int.parse(contents);
        _savedNumberInFile = int.parse(contents);
        print('Reading random number from file: $_numberInFile');
      });
    } catch (e) {
      // If encountering an error, return 0
      setState(() {
        _randomNumber = 0;
      });
    }
  }

  void generateRandomNumber() {
    var random = new Random();
    _randomNumber = random.nextInt(1000000000);
    print('Random number is: $_randomNumber');
    setState(() {
      _randomNumber = _randomNumber;
      _savedRandomNumber = 0;
      _numberInDatabase = 0;
      _numberInFile = 0;
      _savedNumberInFile = 0;
    });
  }

  saveRandomNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('randomNumber', _randomNumber);
      print('Saving random number: $_randomNumber');
    });
  }

  loadRandomNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedRandomNumber = prefs.getInt('randomNumber') ?? 0;
      print('Loading random number: $_randomNumber');
    });
  }

  // removeRandomNumber() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove(_randomNumber);
  //   print('Removed random number: $_randomNumber');
  //   return;
  // }

  saveTodb() async {
    final number = RandomNumber.fromMap({
      "value": _randomNumber,
      "createdTime": DateTime.now(),
    });
    final int id = await dbService.insertNumber(number);
    setState(() {
      _numberInDatabase = _randomNumber;
      _numberInDatabaseId = id;
      _savedNumberInDatabase = 0;
      print('Saving random number in db: $_numberInDatabase');
    });
  }

  loadFromdb() async {
    final RandomNumber number = await dbService.getNumber(_numberInDatabaseId);
    setState(() {
      _randomNumber = number.value;
      _savedNumberInDatabase = _randomNumber;
      print('Loading random number from db: $_randomNumber');
    });
  }

  Widget display() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You have generated random number: '),
          Text(
            '$_randomNumber',
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(height: 5),
          Text('You saved this number in SharedPreference '),
          Text(
            '$_savedRandomNumber',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          Text('You saved this number in database'),
          Text(
            '$_savedNumberInDatabase',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          Text('You saved this number in file'),
          Text(
            '$_savedNumberInFile',
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
              //print("Pressed Load");
              loadFromdb();
            },
            child: Text('Load from SQlite'),
          ),
          OutlinedButton(
            onPressed: () {
              //print("Pressed Random");
              saveTodb();
            },
            child: Text('Save to SQlite'),
          ),
        ],
      ),
    );
  }

  Widget nextTwoButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {
              //print("Pressed Load");
              _readNumberFromFile();
            },
            child: Text('Read from file'),
          ),
          OutlinedButton(
            onPressed: () {
              //print("Pressed Random");
              _writeNumberToFile();
            },
            child: Text('Write to file'),
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
          nextTwoButtons(),
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
