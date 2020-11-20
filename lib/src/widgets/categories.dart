import 'package:flutter/material.dart';
import 'package:mai_ecomm/src/models/category.dart';

List<Categormy> categoriesList = [
  Categormy(name: "Desi", image: 'pizza.jpg'),
  Categormy(name: "Chinese", image: 'chinese.png'),
  Categormy(name: "Desi", image: 'desi.png'),
  Categormy(name: "Desi", image: 'pizza.jpg'),
  Categormy(name: "Chinese", image: 'chinese.png'),
  Categormy(name: "Desi", image: 'desi.png'),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.black,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Card(
              elevation: 3.0,
              color: Colors.black,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Stack(
                        children: [
                          Image.asset(
                            "images/${categoriesList[index].image}",
                            height: 100,
                            width: 100,
                          ),
                          Positioned(
                            left: 10,
                            bottom: 15,
                            child: Text(
                              "${categoriesList[index].name}",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
