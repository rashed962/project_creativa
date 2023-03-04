import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:simple_animations/simple_animations.dart';


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:simple_animations/simple_animations.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  bool _isLoading = false;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();





  List post = [];

  Future<void> getpost() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      post.addAll(responsebody);
    });
    print(post);
  }













  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(


          child: Form(


            key: fromKey,
            child: Container(




              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[







                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(height: 40),
                      Image.asset(
                        'assets/images/ramadan.png',
                        height: 200,
                      ),
                      SizedBox(height: 6),
                      Text("Login UI", style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 40,
                          fontFamily: 'BalooPaaji2',
                          fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("Sign in", style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 40)),
                      SizedBox(height: 16,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email ID",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400),
                            prefixIcon: Icon(
                              Icons.email, color: Colors.grey, size: 18,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade300
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent
                                )
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent
                                )
                            )
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          EmailValidator(errorText: "Enter valid email id")
                        ]),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400),
                            prefixIcon: Icon(
                              Icons.lock, color: Colors.grey, size: 18,),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure ? Icons.visibility : Icons
                                    .visibility_off, color: Colors.grey,
                                size: 18,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade300
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent
                                )
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent
                                )
                            )
                        ),




                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          MinLengthValidator(6, errorText: "Password min 6 char. required"),
                          MaxLengthValidator(15, errorText: "Password should not be grather then 15 char.")
                        ]),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text("Forgot Password", style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(


                        alignment: Alignment.topCenter,
                        height: 60,
                        width: 250,
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.pinkAccent,
                                onPrimary: Colors.pinkAccent,
                                onSurface: Colors.pinkAccent,
                                shadowColor: Colors.pinkAccent,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                post== null || post.isEmpty  ?
                                Center(child: CircularProgressIndicator())


                                    : ListView.builder(itemCount: post.length,

                                    itemBuilder: (context,i){

                                      return Text("${post[i]['title']}");


                                    })


                                ,
                                Text("Login", style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                                Container(
                                  height: 35,
                                  width: 35,
                                  padding: EdgeInsets.all(1.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.pink[400],
                                    child: IconButton(
                                      icon: _isLoading ?
                                      Container(
                                        width: 24,
                                        height: 24,
                                        padding: EdgeInsets.all(2.0),
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 3,
                                        ),
                                      ) : Icon(Icons.arrow_forward, size: 18),

                                      onPressed: () {
                                        if (fromKey.currentState!.validate()) {
                                          //here call your function
                                          print("not valid calling");
                                          this.setState(() {
                                            _isLoading = !_isLoading;
                                          });
                                        } else {
                                          print("not valid");
                                          getpost();
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40)
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Powered by ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Text("DevhubSpot", style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}