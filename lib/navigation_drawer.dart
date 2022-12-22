// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:e_commerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Routes.profilepage);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.contacts_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Routes.cartpage);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 580,),
            TextButton(
              onPressed: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.loginpage);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[900],
                fixedSize: Size(180,60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                'LOG OUT',
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
