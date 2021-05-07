import 'package:flutter/material.dart';
import 'PersonalInformation.dart';
import 'coverLetter.dart';

// ignore: camel_case_types
class resumeBuilderLab6 extends StatefulWidget {
  @override
  _resumeBuilderLab6State createState() => _resumeBuilderLab6State();
}

// ignore: camel_case_types
class _resumeBuilderLab6State extends State<resumeBuilderLab6> {
  // ignore: non_constant_identifier_names
  Widget Tab1() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonalInformation(),
            ),
          );
        },
        //onPressed: () => changeText(),
        padding: EdgeInsets.all(15),
        elevation: 8,
        focusElevation: 4,
        hoverElevation: 4,
        highlightElevation: 8,
        disabledElevation: 0,
        color: Color(0xffffffff),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.navigate_next),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Tab2() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => coverLetter(),
            ),
          );
        },
        //onPressed: () => changeText(),
        padding: EdgeInsets.all(15),
        elevation: 3,
        focusElevation: 4,
        hoverElevation: 4,
        highlightElevation: 8,
        disabledElevation: 0,
        color: Color(0xffffffff),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  'Cover Letter',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.navigate_next),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lab6() {
    return Container(
      child: Column(
        children: <Widget>[
          Tab1(),
          SizedBox(height: 1),
          Tab2(),
          SizedBox(height: 1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resume Builder"),
        backgroundColor: Color(0xff185a37),
      ),
      body: lab6(),
    );
  }
}
