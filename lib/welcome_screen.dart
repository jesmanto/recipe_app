import 'dart:ui';

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
      body: Container(
          // height: (MediaQuery.of(context).size.height / 3) * 2,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/welcome_page_bg.jpeg'),
                  fit: BoxFit.cover)),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 50.0),
            decoration: BoxDecoration(
                color: Color(0x28000000),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: Text(
                    'Your Recipe App',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
                  child: Text(
                    'Spice up your cooking skills with the latest collection '
                    'of recipes from all over the world',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            elevation: 2.0,
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0)),
                        onPressed: _homePage,
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                )
              ],
            ),
          )),
    );
  }

  // This function navigates to the recipes screen
  void _homePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return RecipePage();
    }));
  }
}
