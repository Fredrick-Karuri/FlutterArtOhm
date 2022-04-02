// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new

import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

import 'package:artohm/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:artohm/pages/login.dart';
import 'package:artohm/mywidgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool visible = false;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;

  void userRegistration(String firstName, String lastName, String userEmail,
      String userPassword) async {
    bool isEmailValid = EmailValidator.validate(userEmail);
    if (isEmailValid == true) {
      DialogBuilder(context).showLoadingIndicator(
          "Please wait as we authenticate you", "Authentication");
      Map data = {
        'fname': firstName,
        'lname': lastName,
        'email': userEmail,
        'user_password': userPassword,
      };

      String fname = firstNameController.text;
      String lname = lastNameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;

      var jsonResponse;
      var response = await http.post(
          Uri.parse("https://artohm.000webhostapp.com/register_user.php"),
          body: data);
      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        if (jsonResponse != null) {
          setState(() {
            DialogBuilder(context).hideOpenDialog();
          });
          int isRegistered = jsonResponse['code'];
          if (isRegistered == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Home()));
          } else {
            scaffoldMessenger
                .showSnackBar(createSnackBar("incorrect details "));
          }
        }
      } else {
        setState(() {
          DialogBuilder(context).hideOpenDialog();
        });
      }
    } else {
      scaffoldMessenger
          .showSnackBar(createSnackBar("The email is invalid! Retry..."));
    }
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Image.asset(
                        //     "assets/logo.jpg",
                        //     height: 100,
                        //     width: 100,
                        //   ),
                        // ),
                        Text(
                          "Let's Sign you Up!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create an Account with us",
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
                          makeInput(
                              label: "firstName", controller: firstNameController),
                          makeInput(
                              label: "lastName", controller: lastNameController),
                          makeInput(
                              label: "Email", controller: emailController),
                          makeInput(
                              label: "Password",
                              obscureText: true,
                              controller: passwordController),
                          makeInput(
                              label: "Confirm Password",
                              obscureText: true,
                              controller: confirmPasswordController)
                        ],
                      ),
                    ),
                  
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          onPressed: () {
                            signupFunction();
                          },
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage()));
                          },
                          child: Text(
                            'Login',
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
        ),
      ),
    );
  }

  void signupFunction() {
    if (firstNameController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(createSnackBar("Provide firstName"));
      return;
    } else if (lastNameController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(createSnackBar("Provide lastName"));
      return;
    } else if (emailController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(createSnackBar("Provide Your Email"));
      return;
    } else if (passwordController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(createSnackBar("Provide  your password "));
    }  else if (confirmPasswordController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(createSnackBar("Confirm your password "));
    }
    else {
      if (passwordController.text==confirmPasswordController.text) {
      userRegistration(firstNameController.text,lastNameController.text,emailController.text, passwordController.text);
      } else {
      scaffoldMessenger.showSnackBar(createSnackBar("Your passwords do not match"));
      }

    }
  }

  // void signupFunction() {
  //   if (firstNameController.text.isEmpty) {
  //     scaffoldMessenger.showSnackBar(createSnackBar("Provide firstName"));
  //     return;
  //   } else if (lastNameController.text.isEmpty) {
  //     scaffoldMessenger.showSnackBar(createSnackBar("Provide lastName"));
  //     return;
  //   } else if (emailController.text.isEmpty) {
  //     scaffoldMessenger.showSnackBar(createSnackBar("Provide email"));
  //     return;
  //   } else if (passwordController.text.isEmpty) {
  //     scaffoldMessenger.showSnackBar(createSnackBar("Provide password"));
  //     return;
  //   }else if (confirmPasswordController.text.isEmpty) {
  //     scaffoldMessenger.showSnackBar(createSnackBar("confirm Password"));
  //     return;
  //   }
  //   else {
  //     if (passwordController.text == confirmPasswordController.text) {
  //       userRegistration(firstNameController.text, lastNameController.text,
  //           emailController.text, passwordController.text);
  //     } else {
  //       scaffoldMessenger
  //           .showSnackBar(createSnackBar("Your passwords do not match"));
  //     }
  //   }
  // }

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
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
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
          height: 25,
        )
      ],
    );
  }
}
