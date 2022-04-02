// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:artohm/mywidgets.dart';
import 'package:artohm/pages/home.dart';
import 'package:artohm/pages/signup.dart';

import 'package:artohm/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;

  bool isLoginPage=false;
  bool isRememberMe=false;
  final Prefs _prefs=Prefs();

  void validateUser(String email, String password) async {
    DialogBuilder(context).showLoadingIndicator(
        "Please wait as we authenticate you", "Authentication");
    Map data = {'email': email, 'password': password};
    var jsonResponse;
    var response = await http.post(
        Uri.parse("https://artohm.000webhostapp.com/login.php"),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          DialogBuilder(context).hideOpenDialog();
        });
        int isRegistered = jsonResponse['code'];
        if (isRegistered == 1) {
          var email =jsonResponse["email"];

          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Home()));
        } else {
          scaffoldMessenger.showSnackBar(
              createSnackBar("Incorrect username or password. Try again"));
        }
      }
    } else {
      setState(() {
        DialogBuilder(context).hideOpenDialog();
      });
    }
  }

  // LoginPage(Type loginPage);
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/logo.jpg",
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome! Login with your credentials",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      makeInput(label: "Email", controller: emailController),
                      makeInput(
                          label: "Password",
                          obscureText: true,
                          controller: passwordController),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        loginFunction();
                      },
                      color: Color.fromARGB(255, 7, 41, 230),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white70),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignupPage()));
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      
                    ),
                  ),
                ),

               SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables

                  children: [
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Don't have an account?"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignupPage()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loginFunction() {
    if (emailController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(createSnackBar("Provide username"));
      return;
    } else if (passwordController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(createSnackBar("Provide password"));
      return;
    } else {
      validateUser(emailController.text, passwordController.text);
    }
  }
}

Widget makeInput(
    {label, obscureText = false, TextEditingController? controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                // color: Colors.grey[400],
                ),
          ),
          border: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.grey[400])
              ),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
