// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_tile.dart';

class CartPage extends StatefulWidget {

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  var titles = <String>[];
  var quantity = <String>[];
  var productId = <String>[];
  var images = <String>[];
  int i = 0;
  int count = 0;
  bool run = true;


  //Get all products inside carts of specific user
  void getData2(int id) async{
    Response response = await get(Uri.https('fakestoreapi.com', '/carts/user/$id'));

    List<dynamic> stores = json.decode(response.body);
    int len = stores.length;


    if(run == true){
      for(var i=0; i<len; i++){
        List<dynamic> pro = json.decode(response.body)[i]['products'];
        int len2 = pro.length;
        for(var j=0; j<len2; j++){
          productId.add(jsonDecode(response.body)[i]['products'][j]['productId'].toString());
          quantity.add(jsonDecode(response.body)[i]['products'][j]['quantity'].toString());
        }
      }
    }

    run = false;
    getProducts();
  }

  //Get name and image of specific product by productId
  void getProducts() async{
    if(i != productId.length){
      Response response = await get(Uri.https('fakestoreapi.com', '/products/${productId[i]}'));
      setState(() {
        titles.add(jsonDecode(response.body)['title']);
        //quantity.add(obj[i].quantity.toString());
        images.add(jsonDecode(response.body)['image']);
        print(titles[i]);
        i++;
      });
    }
  }

  //Get ID of the user saved in the storage of the app
  void getID() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('Id');
    getData2(id!);
  }

  @override
  Widget build(BuildContext context) {
    getID();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10, top: 90, right: 10),
        child: Center(
          child: Column(
            children: [
              Text(
                'Cart',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue[900],
                ),
              ),
              //Product block
              Expanded(
                child: ListView.builder(
                    itemCount: titles.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return CartTile(titles[index], quantity[index], images[index]);
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}