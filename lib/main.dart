// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/jewelery_category.dart';
import 'package:e_commerce_app/login_page.dart';
import 'package:e_commerce_app/men_category.dart';
import 'package:e_commerce_app/products_page.dart';
import 'package:e_commerce_app/profile_page.dart';
import 'package:e_commerce_app/shop_page.dart';
import 'package:e_commerce_app/women_category.dart';
import 'package:flutter/material.dart';
import 'electronics_category.dart';
import 'home_page.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        Routes.loginpage:(context)=>LoginPage(),
        Routes.productspage:(context)=>ProductsPage(),
        Routes.shoppage:(context)=>ShopPage(),
        Routes.electronicscategory:(context)=>ElectronicsCategory(),
        Routes.jewelerycategory:(context)=>JeweleryCategory(),
        Routes.mencategory:(context)=>MenCategory(),
        Routes.womencategory:(context)=>WomenCategory(),
        Routes.profilepage:(context)=>ProfiePage(),
        Routes.cartpage:(context)=>CartPage(),
      },
    );
  }
}