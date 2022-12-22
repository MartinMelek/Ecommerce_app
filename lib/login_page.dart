// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'package:e_commerce_app/user.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passenable = true;
  late String username;
  late String pass;
  late SharedPreferences prefs;

  List<User> obj = [];

  //Search for the user by username entered in TextField and save data locally
  void getData() async{
    Response response = await get(Uri.https('fakestoreapi.com', '/users'));
    var userJson = jsonDecode(response.body) as List;
    obj = userJson.map((e) => User.fromJson(e)).toList();

    for(var i=0; i<obj.length; i++){
      if(username == obj[i].username){

        prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', obj[i].username);
        await prefs.setString('email', obj[i].email);
        await prefs.setString('phone', obj[i].phone);
        await prefs.setInt('Id', obj[i].id);
        await prefs.setBool('login', true);

        Navigator.pushNamed(context, Routes.shoppage);
        break;
      }
    }
  }

  //Check if the user logged in before
  void checkLogin() async{
    prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('login')){
      Navigator.pushNamed(context, Routes.shoppage);
    }
  }

  @override
  Widget build(BuildContext context) {
    checkLogin();
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 100, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue[900],
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 80,),
            Text(
              'Username',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              onChanged: (value){username = value;},
              decoration: InputDecoration(
                hintText: 'Enter Username',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.blue.shade900,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            SizedBox(height: 30,),
            Text(
              'Password',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              onChanged: (value){pass = value;},
              obscureText: passenable, //if passenable == true, show **, else show password character
              decoration: InputDecoration(
                hintText: 'Enter Password',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                filled: true,
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.blue.shade900,
                    ),
                  ),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      if(passenable){ //if passenable == true, make it false
                        passenable = false;
                      }else{
                        passenable = true; //if passenable == false, make it true
                      }
                    });
                  },
                  icon: Icon(passenable == true?Icons.remove_red_eye:Icons.password),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 90, top: 100),
              child: TextButton(
                onPressed: (){
                  getData();
                  //print('Username = $username');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  fixedSize: Size(180,60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
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