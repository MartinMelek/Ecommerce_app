// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  String title;
  String price;
  String image;

  ProductTile(this.title, this.price, this.image);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.white,
        elevation: 7,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Center(
            child: Column(
              children: [
                Image(
                  image: NetworkImage(image),
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 10,),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  '\$ $price',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}