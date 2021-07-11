import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_model.dart';
import 'package:recipe_app/single_recipe_page.dart';

class RecipeCard extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String description;
  final List ingredients;
  final List directions;

  const RecipeCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgUrl,
      required this.ingredients,
      required this.directions})
      : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  final titleStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final itemWidth = size.width / 2;
    var gridTile = GridTile(child: Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            )
          ]),
      child: Column(
        children: [
          Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero),
                  child: Image(
                    image: NetworkImage(widget.imgUrl),
                  ))),
          Expanded(
            flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.0, top: 3.0, right: 5.0, bottom: 3.0),
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      style: titleStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0, top: 3.0, right: 5.0, bottom: 3.0),
                    child: Text(
                      widget.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
    
    return GestureDetector(
      child: gridTile,
      onTap: _openSingeRecipePage,
    );
  }

  void _openSingeRecipePage() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return SingleRecipePage(recipe: Recipe(
        title: widget.title,
        description: widget.description,
        imgUrl: widget.imgUrl,
        directions: widget.directions,
        ingredients: widget.ingredients
      ));
    }));
  }
}
