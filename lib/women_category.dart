// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:e_commerce_app/product.dart';
import 'package:e_commerce_app/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WomenCategory extends StatefulWidget {
  @override
  State<WomenCategory> createState() => _WomenCategoryState();
}

class _WomenCategoryState extends State<WomenCategory> {

  List<Product> obj = [];

  void getData() async{
    Response response = await get(Uri.https('fakestoreapi.com', '/products/category/women\'s clothing'));
    setState(() {
      var productJson = jsonDecode(response.body) as List;
      obj = productJson.map((e) => Product.fromJson(e)).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'Women\'s Category',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.blue[900],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: obj.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index){
                  return ProductTile(obj[index].title, obj[index].price.toString(), obj[index].image,);
                }
            ),
          ),
        ],
      ),
    );
  }
}
