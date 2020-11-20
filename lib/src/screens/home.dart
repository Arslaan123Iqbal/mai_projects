import 'package:flutter/material.dart';
import 'package:mai_ecomm/src/helper/flutter_icon.dart';
import 'package:mai_ecomm/src/helper/style.dart';
import 'package:mai_ecomm/src/provider/auth.dart';
import 'package:mai_ecomm/src/widgets/categories.dart';
import 'package:mai_ecomm/src/widgets/customtext.dart';
import 'package:mai_ecomm/src/widgets/featured_products.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What are you looking for? ",
          style: TextStyle(color: Colors.white),
        ),
        actions: [],
      ),
      //For drawer
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: CustomText(
                  text: authProvider.userModel.name,
                ),
                accountEmail: CustomText(text: "authProvider.userModel.email"))
          ],
        ),
      ),

      backgroundColor: Colors.black,

      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "What are you looking for?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                        ),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            //For Search bar
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.orange[300],
                          offset: Offset(1, 1),
                          blurRadius: 4.0),
                    ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.orange[300],
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: Colors.orange[300],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // Categories list
            Categories(),
            // Text Featured
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Featured",
                color: Colors.grey[300],
              ),
            ),
            // Featured products list
            Featured(),
            //End Featured product list end Here

            // For popular products
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Popular",
                color: Colors.grey[300],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("images/pizza.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fajita Pizza ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      Text("RS 300",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins"))
                      // End Popular Products here
                      ,
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      //Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: (MediaQuery.of(context).size.height) * 0.1,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/cart.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/cart.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/cart.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/cart.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              Container(
                height: 3,
                width: MediaQuery.of(context).size.width - 200,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
