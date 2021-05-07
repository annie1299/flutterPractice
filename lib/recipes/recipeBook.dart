import 'package:flutter/material.dart';
import 'recipeDetail.dart';

// ignore: camel_case_types
class recipeBook extends StatefulWidget {
  @override
  _recipeBookState createState() => _recipeBookState();
}

// ignore: camel_case_types
class _recipeBookState extends State<recipeBook> {
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
  ];

  Widget lab7() {
    return Container(
      child: ListView.builder(
        itemCount: recipeNames.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            color: Color(0xffd0f0c0),
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            //margin: EdgeInsets.all(3),
            child: ListTile(
              leading: Image.asset(
                "assets/images/${recipeImages[index]}",
                width: 70,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(
                '${recipeNames[index]}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff185a37),
                ),
              ),
              subtitle: Text(
                '${timeForCooking[index]}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RecipeDetail(
                      recipeImageFromPrevScreen: '${recipeImages[index]}',
                      recipeNameFromPrevScreen: '${recipeNames[index]}',
                      recipeTimeFromPrevScreen: '${timeForCooking[index]}',
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
        title: Text("Recipe Book"),
        backgroundColor: Color(0xff185a37),
      ),
      body: lab7(),
    );
  }
}
