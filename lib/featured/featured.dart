import 'package:flutter/material.dart';
import 'TabFeatured1.dart';
import 'TabFeatured3.dart';
import 'TabFeatured2.dart';

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Featured"),
              backgroundColor: Color(0xff185a37),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Tab 1",
                  ),
                  Tab(
                    text: "Tab 2",
                  ),
                  Tab(
                    text: "Tab 3",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                TabFeatured1(),
                TabFeatured2(),
                TabFeatured3(),
              ],
            )),
      ),
    );
  }
}
