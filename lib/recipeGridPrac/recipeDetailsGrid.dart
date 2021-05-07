import 'package:flutter/material.dart';

class RecipeDetailsOfGrid extends StatefulWidget {
  final recipeNameFromGridView;
  final recipeImageFromGridView;
  final recipeTimeFromGridView;

  RecipeDetailsOfGrid({
    Key key,
    @required this.recipeNameFromGridView,
    this.recipeImageFromGridView,
    this.recipeTimeFromGridView,
    String recipeImagesFromGridView,
  }) : super(key: key);

  @override
  _RecipeDetailsOfGridState createState() => _RecipeDetailsOfGridState();
}

class _RecipeDetailsOfGridState extends State<RecipeDetailsOfGrid> {
  // ignore: non_constant_identifier_names
  Widget RecipeImage() {
    return Container(
      child: Card(
        elevation: 20,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.greenAccent[100],
        child: SizedBox(
          height: 250,
          width: 340,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/${widget.recipeImageFromGridView}',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget RecipeNameAndStuff() {
    return Container(
      child: Card(
        elevation: 20,
        color: Color(0xffd0f0c0),
        margin: EdgeInsets.symmetric(horizontal: 13, vertical: 1),
        child: SizedBox(
          height: 350,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff185a37),
                  ),
                ),
                trailing: Text(
                  '${widget.recipeTimeFromGridView}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff185a37),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Text(
                'Strawberry Pineapple Banana Smoothie:\n(This is not a dynamic content) \n\n- 1 cup Strawberries \n\n- 1/2 cup Pineapple \n\n- 1 Banana \n\n- 2 cups Orange Juice \n\n- 1/2 cup Greek Yogurt \n\n- 1 cup Spinach (optional) \n\n- 1 tbs Chia',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff185a37),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recipeDetailsGridView() {
    return Container(
      decoration: new BoxDecoration(color: Color(0xffd0f0c0)),
      child: Align(
        //alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 2),
            RecipeImage(),
            SizedBox(height: 10),
            RecipeNameAndStuff(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.recipeNameFromGridView}'),
        backgroundColor: Color(0xff185a37),
      ),
      body: recipeDetailsGridView(),
    );
  }
}
