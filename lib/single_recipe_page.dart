import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_model.dart';

class SingleRecipePage extends StatelessWidget {
  final Recipe recipe;

  const SingleRecipePage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var _body = Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Image.network(
              recipe.imgUrl,
              fit: BoxFit.fill,
            ),

            height: size.height / 3,
            width: size.width,
            // child:
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              recipe.description,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.red),
            alignment: Alignment.center,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(top: 10.0),
            width: size.width,
            child: Text(
              'Ingredients',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Column(
              children: _buildIngredientsList(),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.red),
            alignment: Alignment.center,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(top: 20.0),
            width: size.width,
            child: Text(
              'Directions',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Column(
              children: _buildDirectionsList(),
            ),
          )
        ],
      ),
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: _body,
    );
  }

  List<Widget> _buildIngredientsList() {
    var ingredients = <Widget>[];
    for (var ingredient in recipe.ingredients) {
      ingredients.add(ListTile(
          leading: Text('${recipe.ingredients.indexOf(ingredient, 0) + 1}.',
              style: TextStyle(fontWeight: FontWeight.bold)),
          title: Text(ingredient)));
    }
    return ingredients;
  }

  List<Widget> _buildDirectionsList() {
    var directions = <Widget>[];
    for (var direction in recipe.directions) {
      directions.add(Column(
        children: [
          ListTile(
            leading: Text(
              'Step ${recipe.directions.indexOf(direction, 0) + 1}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Text(direction),
          ),
          Divider(
            color: Colors.black45,
          )
        ],
      ));
    }
    ;
    return directions;
  }
}
