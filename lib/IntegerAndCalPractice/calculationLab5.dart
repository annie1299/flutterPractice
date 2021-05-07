import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class calculationLab5 extends StatefulWidget {
  final firstIntegerValue;
  final secondIntegerValue;
  calculationLab5({
    Key key,
    @required this.firstIntegerValue,
    this.secondIntegerValue,
  }) : super(key: key);

  @override
  _calculationLab5State createState() => _calculationLab5State();
}

// ignore: camel_case_types
class _calculationLab5State extends State<calculationLab5> {
  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static const rowSpacer = TableRow(children: [
    SizedBox(height: 15),
    SizedBox(height: 15),
    SizedBox(height: 15),
    SizedBox(height: 15),
    SizedBox(height: 15),
  ]);

  Widget calculationsTable1() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Table(
        children: [
          TableRow(children: [
            Text(
              "1",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "+",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.firstIntegerValue,
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "=",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              (1 + int.parse(widget.firstIntegerValue)).toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]),
          rowSpacer,
          TableRow(children: [
            Text(
              "2",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "+",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.secondIntegerValue,
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "=",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              (2 + int.parse(widget.secondIntegerValue)).toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]),
          rowSpacer,
          TableRow(children: [
            Text(
              "Total:    3",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            Text(
              "+",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              (int.parse(widget.firstIntegerValue) +
                      int.parse(widget.secondIntegerValue))
                  .toString(),
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "=",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              (3 +
                      (int.parse(widget.secondIntegerValue) +
                          int.parse(widget.firstIntegerValue)))
                  .toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]),
          rowSpacer,
        ],
      ),
    );
  }

  Widget calculationsTable2() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Table(
        children: [
          TableRow(children: [
            Text(
              "3",
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "+",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.firstIntegerValue,
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "=",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              (3 + int.parse(widget.firstIntegerValue)).toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]),
          rowSpacer,
          TableRow(children: [
            Text(
              "4",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "+",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.secondIntegerValue,
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "=",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              (4 + int.parse(widget.secondIntegerValue)).toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]),
          rowSpacer,
          TableRow(children: [
            Text(
              "Total:     7",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            Text(
              "+",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              (int.parse(widget.firstIntegerValue) +
                      int.parse(widget.secondIntegerValue))
                  .toString(),
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              "=",
              style: TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              (7 +
                      (int.parse(widget.secondIntegerValue) +
                          int.parse(widget.firstIntegerValue)))
                  .toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]),
          rowSpacer,
        ],
      ),
    );
  }

  Widget sectionTotal1() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Colors.grey,
      child: Text(
        'Section: ' +
            (3 +
                    (int.parse(widget.secondIntegerValue) +
                        int.parse(widget.firstIntegerValue)))
                .toString(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget sectionTotal2() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Colors.grey,
      child: Text(
        'Section: ' +
            (7 +
                    (int.parse(widget.secondIntegerValue) +
                        int.parse(widget.firstIntegerValue)))
                .toString(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget calculations() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          sectionTotal1(),
          calculationsTable1(),
          sectionTotal2(),
          calculationsTable2(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculations"),
        backgroundColor: Color(0xff185a37),
      ),
      body: calculations(),
    );
  }
}
