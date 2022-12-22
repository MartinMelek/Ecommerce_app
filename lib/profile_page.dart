// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfiePage extends StatefulWidget {

  String username = '';
  String email = '';
  String phone = '';

  @override
  State<ProfiePage> createState() => _ProfiePageState();
}

class _ProfiePageState extends State<ProfiePage> {

  //Get user data saved locally
  void getProfile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.username = prefs.getString('username')!;
      widget.email = prefs.getString('email')!;
      widget.phone = prefs.getString('phone')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    getProfile();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 90),
        child: Center(
          child: Column(
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 70,),
              Row(
                children: [
                  Text(
                    'Username: ',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.blue[900],
                    ),
                  ),
                  Text(
                    '${widget.username}',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    'Email: ',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.blue[900],
                    ),
                  ),
                  Text(
                    '${widget.email}',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    'Phone: ',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.blue[900],
                    ),
                  ),
                  Text(
                    '${widget.phone}',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
                width: 250,
                child: Divider(
                  color: Colors.blue[900],
                  thickness: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}