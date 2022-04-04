// ignore_for_file: prefer_const_constructors

import 'package:artohm/pages/home.dart';
import 'package:artohm/pages/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/logo.jpg",
              height: 100,
              width: 100,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          ),
          Text(
            "A taste of good Tech",
            style: TextStyle(
                color: Colors.black87.withOpacity(0.7),
                fontWeight: FontWeight.w500,
                fontSize: 28),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/Buynow.png'),
              )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white70),
                                ),
    
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext
                                                  context) =>
                                              // LoginPage()));
                                              LoginPage()));
                                },
    
                                color:
                                    Color.fromARGB(255, 7, 41, 230),
                                // color: Color= Color(0xffb74093),
    
                                // const Color = const Color(0xffb74093),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text(
                                  "Skip Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext
                                                  context) =>
                                              // LoginPage()));
                                              Home()));
                                },
                                color:
                                    Color.fromARGB(255, 10, 236, 180),
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
