import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/utils/functions/extension_functions.dart';
import 'package:recipe_app/view/screens/recipe_page.dart';
import 'package:recipe_app/view/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                      elevation: 5.0,
                    ),
                    onPressed: () {
                      auth
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((value) => {
                                closeKeyboard(context),
                                showSnackBar(
                                    context, 'Login Successful', Colors.green),
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => RecipePage()))
                              })
                          .catchError((loginError) {
                        closeKeyboard(context);
                        showSnackBar(context,
                            loginError.toString().substring(31), Colors.red);
                      });
                    },
                    child:
                        Text('Login', style: TextStyle(color: Colors.white))),
                TextButton(
                    onPressed: () {
                      closeKeyboard(context);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return SignUp();
                      }));
                    },
                    child: Text(
                      'Not yet registered? Sign up',
                      style: TextStyle(color: Colors.blueAccent),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
