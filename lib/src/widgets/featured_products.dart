import 'package:flutter/material.dart';
import 'package:mai_ecomm/src/helper/screen_navigation.dart';
import 'package:mai_ecomm/src/helper/style.dart';
import 'package:mai_ecomm/src/models/products.dart';
import 'package:mai_ecomm/src/screens/details.dart';

import 'customtext.dart';

List<Products> productlist = [
  Products(
      name: "Biryani",
      image: 'desi.jpg',
      rating: 4.7,
      price: 200,
      vendor: "Irfan",
      wishlist: true),
  Products(
      name: "Daal",
      image: 'desi.jpg',
      rating: 4.7,
      price: 300,
      vendor: "Irfan",
      wishlist: false)
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height) * 0.22,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productlist.length,
          itemBuilder: (_, index) {
            return Stack(
              children: [
                Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        changeScreen(
                            context,
                            DeatailsProduct(
                              products: productlist[index],
                            ));
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Row(
                          children: [
                            Image.asset("images/${productlist[index].image}",
                                width: (MediaQuery.of(context).size.width) / 2),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomText(
                                      text: "${productlist[index].name}",
                                      color: white,
                                      weight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: "Rice Meals",
                                      color: grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 1.0,
                                        width: 50.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 15.0,
                                        ),
                                        CustomText(
                                          text: "4.7",
                                          color: grey,
                                          size: 10,
                                        ),
                                        CustomText(
                                          text: ".",
                                          color: grey,
                                          weight: FontWeight.bold,
                                          size: 10,
                                        ),
                                        CustomText(
                                          text: "40-50mins",
                                          color: grey,
                                          size: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "RS 210",
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        CustomText(
                                          text:
                                              "RS ${productlist[index].price}",
                                          color: white,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -0.01,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(-70, 50))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '50% off',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
