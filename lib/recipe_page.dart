import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_card.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    return Scaffold(
        appBar: AppBar(
          title: Text('Recipe App'),
        ),
        body: StreamBuilder(
          stream: firestoreInstance.collection('recipes').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2/3,
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) =>
                    _buildRecipeCard(context, snapshot.data!.docs[index]));
          },
        ));
  }
  Widget _buildRecipeCard(BuildContext context, DocumentSnapshot document) {

    return RecipeCard(
        title: document['title'],
        description: document['description'],
        imgUrl: document['imageUrl'],
        ingredients: document['ingredents'],
        directions: document['directions']);
  }
}

