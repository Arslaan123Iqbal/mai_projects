import 'package:flutter/material.dart';

import 'package:mai_ecomm/src/helper/screen_navigation.dart';
import 'package:mai_ecomm/src/provider/auth.dart';
import 'package:mai_ecomm/src/screens/home.dart';

import 'package:mai_ecomm/src/screens/register.dart';
import 'package:mai_ecomm/src/widgets/loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return authProvider.status == Status.Authenticating
        ? Loading()
        : Scaffold(
            key: _key,
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 195,
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
                            height: (MediaQuery.of(context).size.height) * 0.4,
                            width: (MediaQuery.of(context).size.height) * 0.4,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 26, 26, 26),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            // Email and Password
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                //For Email
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
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
                                // For Password
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.orange),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
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
                                //Button For Login
                                ButtonTheme(
                                  minWidth: 200,
                                  height: 50,
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (!await authProvider.signIn()) {
                                        _key.currentState.showSnackBar(SnackBar(
                                            content: Text("Login Failed")));
                                        return;
                                      }
                                      authProvider.clearController();
                                      changeScreenReplacement(
                                          context, HomePage());
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 17),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    color: Colors.black,
                                    splashColor: Colors.orange,
                                    textColor: Colors.white60,
                                  ),
                                ),
                              ],
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
                    height: 20,
                  ),
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
                  SizedBox(height: 40),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Text(
                            "I dont't have an Account?",
                            style: TextStyle(color: Colors.white60),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              changeScreen(context, RegisterScreen());
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
