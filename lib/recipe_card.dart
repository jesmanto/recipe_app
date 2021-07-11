import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final itemWidth = size.width / 2;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: itemHeight,
        width: itemWidth,
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
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    style: titleStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ))
          ],
        ),
      ),
      onTap: _openSingeRecipePage,
    );
  }

  void _openSingeRecipePage() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(appBar: AppBar(title: Text('Single Recipe Page')));
    }));
  }
}
