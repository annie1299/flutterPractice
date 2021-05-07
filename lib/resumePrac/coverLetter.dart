import 'package:flutter/material.dart';

// ignore: camel_case_types
class coverLetter extends StatefulWidget {
  @override
  _coverLetterState createState() => _coverLetterState();
}

// ignore: camel_case_types
class _coverLetterState extends State<coverLetter> {
  bool isSwitched = false;

  void displayPhotoOrNotMethod(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        print(isSwitched);
      });
    } else if (isSwitched == true) {
      setState(() {
        isSwitched = false;
        print(isSwitched);
      });
    }
  }

  Widget date() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Date: ',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff185a37),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 6),
          SizedBox(
            height: 40,
            child: TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(),
                hintText: '07-April-2021',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addressedTo() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Addressed To (optional): ',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff185a37),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 6),
          SizedBox(
            height: 100,
            child: TextField(
              maxLines: 5,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                fillColor: Colors.grey[300],
                filled: true,
                hintText: 'Hiring Manager \nXYZ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyofInfo() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Body: ',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff185a37),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 6),
          SizedBox(
            height: 300,
            child: TextField(
              maxLines: 50,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                fillColor: Colors.grey[300],
                filled: true,
                hintText: 'Respected Sir, \nAoa, ....',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget coverletterInfo() {
    return Visibility(
      visible: isSwitched,
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          date(),
          SizedBox(height: 10),
          addressedTo(),
          SizedBox(height: 10),
          bodyofInfo(),
        ],
      ),
    );
  }

  Widget coverLetSwitch() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Cover Letter: ',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff185a37),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Switch(
              value: isSwitched,
              onChanged: displayPhotoOrNotMethod,
              activeTrackColor: Color(0xff5ac48e),
              activeColor: Color(0xff185a37),
            ),
          ),
        ],
      ),
    );
  }

  Widget coverLet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          coverLetSwitch(),
          SizedBox(height: 10),
          coverletterInfo(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cover Letter"),
        backgroundColor: Color(0xff185a37),
      ),
      body: coverLet(),
    );
  }
}
