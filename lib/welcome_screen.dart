import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: (MediaQuery.of(context).size.height / 3) * 2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/welcome_page_bg.jpeg'),
                fit: BoxFit.cover)),
      ),
      Expanded(
          child: Center(
        child: TextButton(
          style: TextButton.styleFrom(
              elevation: 2.0,
              backgroundColor: Colors.red,
              padding: EdgeInsets.all(20.0)),
          onPressed: _homePage,
          child: Text(
            'Get Started',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ))
    ]));
  }

  // This function navigates to the recipes screen
  void _homePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return RecipePage();
    }));
  }
}
