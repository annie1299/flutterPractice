import 'package:flutter/material.dart';

class RecipeDetail extends StatefulWidget {
  final recipeImageFromPrevScreen;
  final recipeNameFromPrevScreen;
  final recipeTimeFromPrevScreen;

  RecipeDetail({
    Key key,
    @required this.recipeImageFromPrevScreen,
    this.recipeNameFromPrevScreen,
    this.recipeTimeFromPrevScreen,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  // ignore: non_constant_identifier_names
  Widget RecipeImage() {
    return Container(
      child: CircleAvatar(
        backgroundImage:
            AssetImage('assets/images/${widget.recipeImageFromPrevScreen}'),
        backgroundColor: Colors.black,
        radius: 80,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget RecipeName() {
    return Container(
      child: Text(
        '${widget.recipeNameFromPrevScreen}',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff185a37),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget RecipeTimeForCooking() {
    return Container(
      child: Text(
        'Time required for cooking: ${widget.recipeTimeFromPrevScreen}',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget InfoAboutRecipe() {
    return Container(
      child: Text('I will update the discription real soon!'),
    );
  }

  Widget recipeDetailsView() {
    return Container(
      decoration: new BoxDecoration(color: Color(0xffd0f0c0)),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RecipeImage(),
            SizedBox(height: 20),
            RecipeName(),
            SizedBox(height: 20),
            RecipeTimeForCooking(),
            SizedBox(height: 20),
            InfoAboutRecipe(),
            SizedBox(height: 140),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.recipeNameFromPrevScreen}'),
        backgroundColor: Color(0xff185a37),
      ),
      body: recipeDetailsView(),
    );
  }
}
