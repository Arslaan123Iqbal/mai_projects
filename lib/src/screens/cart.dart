import 'package:flutter/material.dart';
import 'package:mai_ecomm/src/helper/flutter_icon.dart';
import 'package:mai_ecomm/src/helper/style.dart';
import 'package:mai_ecomm/src/models/category.dart';
import 'package:mai_ecomm/src/models/products.dart';
import 'package:mai_ecomm/src/widgets/categories.dart';
import 'package:mai_ecomm/src/widgets/customtext.dart';

class Cart extends StatefulWidget {
  final Products products;
  final Categormy categories;

  const Cart({Key key, this.products, this.categories}) : super(key: key);
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset("images/burger.jpg"),
              ),
              //For back arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 14,
                      ),
                    ),
                  ),
                  //For i dont know
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Icon(
                        Icons.kitchen,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "images/${widget.products.image}",
                      height: (MediaQuery.of(context).size.width) * 0.3,
                      width: (MediaQuery.of(context).size.width) * 0.4,
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: "${widget.products.name}",
                          color: white,
                        ),
                        CustomText(
                          text: "${widget.categories.name}",
                          color: grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 1.0,
                            width: 70.0,
                            color: Colors.grey,
                          ),
                        ),
                        CustomText(
                          text: "Rs 150   ",
                          color: white,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: "Hello",
                          color: white,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Card(
                          color: Colors.black,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.orange),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.zero)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.orange,
                                        size: 10,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Text(
                                    '${1}',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
