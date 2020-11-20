import 'package:flutter/material.dart';
import 'package:mai_ecomm/src/helper/screen_navigation.dart';

import 'package:mai_ecomm/src/provider/auth.dart';
import 'package:mai_ecomm/src/screens/login.dart';
import 'package:mai_ecomm/src/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return authProvider.status == Status.Authenticating
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 180,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          height: (MediaQuery.of(context).size.height) * 0.4,
                        ),
                        //Card For Login
                        Positioned(
                          right: 40,
                          top: 220,
                          child: Container(
                            height: (MediaQuery.of(context).size.height) * 0.45,
                            width: (MediaQuery.of(context).size.height) * 0.4,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 26, 26, 26),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            // Email and Password
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  //For Email
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 1),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.orange),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          controller: authProvider.email,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.orange,
                                                fontFamily: "Poppins"),
                                            border: InputBorder.none,
                                            hintText: "Email",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //Phone Number
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 1),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.orange),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          controller: authProvider.phone,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.orange,
                                                fontFamily: "Poppins"),
                                            border: InputBorder.none,
                                            hintText: "Phone Number",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // For Password
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 1),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.orange),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 1),
                                        child: TextFormField(
                                          controller: authProvider.password,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.orange,
                                                fontFamily: "Poppins"),
                                            border: InputBorder.none,
                                            hintText: "Password",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //For Confirm Password
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 1),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.orange),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 1),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.orange,
                                                fontFamily: "Poppins"),
                                            border: InputBorder.none,
                                            hintText: "Confirm Password",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  //Button For Login
                                  ButtonTheme(
                                    minWidth: 150,
                                    height: 50,
                                    child: RaisedButton(
                                      onPressed: () async {
                                        if (!await authProvider.signUp()) {
                                          _key.currentState.showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      "Registration Failed")));
                                          return;
                                        }
                                        authProvider.clearController();
                                        changeScreenReplacement(
                                            context, HomePage());
                                      },
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 17),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0)),
                                      color: Colors.black,
                                      splashColor: Colors.blue,
                                      textColor: Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // END Card
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      "or",
                      style: TextStyle(color: Colors.white60),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //For Facebook Login Button
                  Container(
                    height: 50.0,
                    width: 150.0,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'images/f.png',
                              height: 15,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Facebook",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 30),
                  //For Sign in
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Text(
                            "Already have an Account?",
                            style: TextStyle(color: Colors.white60),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              changeScreen(context, LoginScreen());
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
  }
}
