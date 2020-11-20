import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:mai_ecomm/src/helper/screen_navigation.dart';
import 'package:mai_ecomm/src/helper/style.dart';
import 'package:mai_ecomm/src/models/products.dart';
import 'package:mai_ecomm/src/screens/cart.dart';
import 'package:mai_ecomm/src/widgets/customtext.dart';

class DeatailsProduct extends StatefulWidget {
  final Products products;

  DeatailsProduct({this.products});
  @override
  _DeatailsProductState createState() => _DeatailsProductState();
}

class _DeatailsProductState extends State<DeatailsProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    child: Carousel(
                      images: [
                        AssetImage("images/${widget.products.image}"),
                        AssetImage("images/${widget.products.image}"),
                        AssetImage("images/${widget.products.image}"),
                      ],
                      dotColor: Colors.green,
                      dotBgColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            CustomText(
              text: widget.products.name,
              color: white,
              size: 34,
              weight: FontWeight.w400,
            ),
            Text(
              "Rs 210",
              style: TextStyle(
                  color: Colors.orange, decoration: TextDecoration.lineThrough),
            ),
            CustomText(
              text: "RS " + widget.products.price.toString(),
              color: Colors.orange,
              size: 20,
              weight: FontWeight.w400,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                changeScreen(context, Cart());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "Add to Cart",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
