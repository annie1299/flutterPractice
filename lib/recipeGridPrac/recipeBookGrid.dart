import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'recipeDetailsGrid.dart';

// ignore: camel_case_types
class recipeBookGrid extends StatefulWidget {
  @override
  _recipeBookGridState createState() => _recipeBookGridState();
}

// ignore: camel_case_types
class _recipeBookGridState extends State<recipeBookGrid> {
  final List<String> recipeNames = [
    "Biryani",
    "Halwa",
    "Italian",
    "Karahi",
    "Noodles",
    "Pasta",
    "Pizza",
    "Salad",
    "Smoothie",
    "Soup",
    "Biryani",
    "Halwa",
    "Italian",
    "Karahi",
    "Noodles",
    "Pasta",
    "Pizza",
    "Salad",
    "Smoothie",
    "Soup",
  ];
  final List<String> recipeImages = [
    "biryani.jpg",
    "halwa.jpg",
    "italian.jpg",
    "karahi.jpg",
    "noodles.jpg",
    "pasta.jpg",
    "pizza.jpg",
    "salad.jpg",
    "smoothie.jpg",
    "soup.jpg",
    "biryani.jpg",
    "halwa.jpg",
    "italian.jpg",
    "karahi.jpg",
    "noodles.jpg",
    "pasta.jpg",
    "pizza.jpg",
    "salad.jpg",
    "smoothie.jpg",
    "soup.jpg",
  ];
  final List<String> timeForCooking = [
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
    "20 mins",
    "30 mins",
  ];

  Widget lab8() {
    return Container(
      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
      decoration: new BoxDecoration(color: Colors.white),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: recipeNames.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
            color: Color(0xff185a37),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/images/${recipeImages[index]}',
                          height: 75,
                          width: 105,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  SizedBox(
                    child: Text(
                      'Time: ${timeForCooking[index]}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RecipeDetailsOfGrid(
                      recipeImageFromGridView: '${recipeImages[index]}',
                      recipeNameFromGridView: '${recipeNames[index]}',
                      recipeTimeFromGridView: '${timeForCooking[index]}',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
        backgroundColor: Color(0xff185a37),
      ),
      body: lab8(),
    );
  }
}
