import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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

  Widget name() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Name: ',
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
                hintText: 'Name',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget address() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Address: ',
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
                hintText: 'House No. 1, St. No. 2',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget email() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email: ',
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
                hintText: 'abc@gmail.com',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneNum() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Phone No.: ',
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
                hintText: '0332 1234567 ',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget photoSwitch() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Photo: ',
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

  Widget photo() {
    return Visibility(
      visible: isSwitched,
      child: Container(
        height: 150,
        width: 150,
        color: Color(0xff185a37),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Sample Picture',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget personalInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          name(),
          SizedBox(height: 10),
          address(),
          SizedBox(height: 10),
          email(),
          SizedBox(height: 10),
          phoneNum(),
          SizedBox(height: 10),
          photoSwitch(),
          SizedBox(height: 10),
          photo(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Information"),
        backgroundColor: Color(0xff185a37),
      ),
      body: personalInfo(),
    );
  }
}
