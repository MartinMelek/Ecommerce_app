// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  String title;
  String quantity;
  String image;

  CartTile(this.title, this.quantity, this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 7,
      margin: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image(
              height: 80,
              width: 80,
              image: NetworkImage(image),
            ),
            SizedBox(width: 5,),
            SizedBox( //Here is the name and quantity of the product
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(
                        text: 'Name: ',
                        style: TextStyle(
                            color: Colors.blueGrey.shade800,
                            fontSize: 16.0),
                        children: [
                          TextSpan(
                              text:
                              '$title\n',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)),
                        ]),
                  ),
                  SizedBox(height: 5,),
                  RichText(
                    maxLines: 1,
                    text: TextSpan(
                        text: 'Unit: ',
                        style: TextStyle(
                            color: Colors.blueGrey.shade800,
                            fontSize: 16.0),
                        children: [
                          TextSpan(
                              text:
                              '$quantity\n',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}