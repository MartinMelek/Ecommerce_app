// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class ShopPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Padding(
        padding: EdgeInsets.only(top: 40, right: 10, left: 10),
        child: Column(
          children: [
            Row(
              children: [
                Builder(builder: (context){
                  return Container(
                    margin: EdgeInsets.only(bottom: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue[900],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu, color: Colors.white,size: 30,),
                    ),
                  );
                }),
                SizedBox(width: 95,),
                Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Text(
                    'SHOP',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[900]
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 170,
                  height: 170,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.electronicscategory);
                    },
                    child: Card(
                      color: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/electronics.png'),
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            'Electronics',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                SizedBox(
                  width: 170,
                  height: 170,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.jewelerycategory);
                    },
                    child: Card(
                      color: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/jewelry.png'),
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            'Jewelry',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(
                  width: 170,
                  height: 170,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.mencategory);
                    },
                    child: Card(
                      color: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/men clothing.png'),
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            'Men Clothes',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                SizedBox(
                  width: 170,
                  height: 170,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.womencategory);
                    },
                    child: Card(
                      color: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/women clothing.png'),
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            'Women Clothes',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, Routes.productspage);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[900],
                fixedSize: Size(180,60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                'All Products',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}