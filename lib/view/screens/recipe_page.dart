import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/utils/functions/extension_functions.dart';
import 'package:recipe_app/view/screens/login_screen.dart';
import 'package:recipe_app/view/widgets/recipe_card.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;

    return Scaffold(
        appBar: AppBar(
          title: Text('Recipe App'),
          actions: [
            IconButton(
              onPressed: () => signOut(context, auth),
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: StreamBuilder(
          stream: firestoreInstance.collection('recipes').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 1.209,
                  crossAxisCount: 1,
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

  void signOut(BuildContext context, FirebaseAuth auth) {
    showSnackBar(context, 'Logout Successful', Colors.green);
    auth.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
