// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 150),
              child: Text(
                'Welcome to ',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Text(
                'E-Commerce App',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue[900]
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 110, top: 250),
              child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  fixedSize: Size(150,70),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 90, top: 10),
              child: Row(
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                    ),
                  ),
                  GestureDetector(
                    onTap: () {Navigator.pushNamed(context, Routes.loginpage);},
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold
                      ),
                    ),
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