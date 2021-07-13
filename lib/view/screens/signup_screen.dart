import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/utils/functions/extension_functions.dart';
import 'package:recipe_app/view/screens/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String _fname, _lname, _email, _password, _confirmPassword;
  final auth = FirebaseAuth.instance;
  late User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register an account'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'First Name'),
                  onChanged: (value) {
                    setState(() {
                      _fname = value.trim();
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Last Name'),
                  onChanged: (value) {
                    setState(() {
                      _lname = value.trim();
                    });
                  },
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email address'),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
                TextField(
                  obscureText: true,
                  restorationId: 'confirmPassword',
                  decoration: InputDecoration(hintText: 'Confirm Password'),
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = value.trim();
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 10.0),
                          elevation: 5.0,
                        ),
                        onPressed: () {
                          if (_password == _confirmPassword) {
                            auth
                                .createUserWithEmailAndPassword(
                                    email: _email, password: _password)
                                .then((user) => {
                                      showSnackBar(
                                          context,
                                          'Successfully created an account',
                                          Colors.green),
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()))
                                    })
                                .catchError((signUpError) {
                              showSnackBar(
                                  context,
                                  signUpError.toString().substring(37),
                                  Colors.red);
                            });
                          } else {
                            showSnackBar(
                                context, 'Password does not match', Colors.red);
                          }
                        },
                        child: Text('Sign Up',
                            style: TextStyle(color: Colors.white))),
                    TextButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (BuildContext context) {
                            return LoginScreen();
                          }));
                        },
                        child: Text('Already registered? Login', style: TextStyle(color: Colors.blueAccent),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
