import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utililties/Utils.dart';
import '../Utililties/colors.dart';
import 'BottomNavigationBar/BottomTabsCustomWidget.dart';


class Login extends StatefulWidget {
  static final String id = "login_screen";
  const Login({Key? key}) : super(key: key);


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isLoginCompleted = false;
  String username = 'bhupalreddy1990@gmail.com';
  String password = '123456';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  bool _isHiddenPassword = true;
  bool _isInvalidLogin = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                AssetImage("assets/bg.jpeg"),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(

            child: Column(
              children: [
                SizedBox(height: height * 0.1),
                Container(child: Text('Log in', style: Utils.getHeaderFont(),)),
                SizedBox(height: height * 0.05),
                Container(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16, bottom: 16),
                            child: TextFormField(
                              onSaved: (value) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((timeStamp) {
                                  _emailField.text = value!;
                                });
                              },
                              controller: _emailField,
                              validator: (email) {
                                if (email!.isEmpty) {
                                  return 'Phone number or email should not be empty';
                                }
                                if (_isInvalidLogin) {
                                  return '';
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: Utils.getTitleFont(Colors.black),

                              decoration: InputDecoration(
                                hintStyle: Utils.getTitleFont(Colors.grey),
                                hintText: 'Email',
                                filled: true,
                                fillColor: Color(0xffF7F7F7),
                                contentPadding:
                                EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffF7F7F7),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Color(0xffF7F7F7),
                                    )),

                              ),

                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: TextFormField(
                              onSaved: (value) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((timeStamp) {
                                  _passwordField.text = value!;
                                });
                              },
                              controller: _passwordField,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password should not be empty';
                                }
                                return null;
                              },
                              style: Utils.getTitleFont(Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              obscureText: _isHiddenPassword,
                              decoration: InputDecoration(
                                hintStyle: Utils.getTitleFont(Colors.grey),
                                hintText: 'Password',
                                filled: true,
                                fillColor: Color(0xffF7F7F7),
                                contentPadding:
                                EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffF7F7F7),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Color(0xffF7F7F7),
                                    )),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isHiddenPassword = !_isHiddenPassword;
                                    });
                                  },
                                  child: Icon(
                                    _isHiddenPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.1),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: SizedBox(
                              height: 50,
                              width: width,
                              child: ElevatedButton(
                                child: Text('Log In'),
                                onPressed: () async {

                                  if (_formKey.currentState!.validate()) {
                                    if(username == _emailField.text.toString() &&
                                        password == _passwordField.text.toString()){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BottomTabsCustomWidget(
                                              menuScreenContext: context,
                                              selectedIndex: 0,
                                            )),
                                      );
                                      setState(() {
                                        isLoginCompleted = false;
                                      });
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            "Username or Password incorrect."),
                                      ));
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: appColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(24), // <-- Radius
                                    ),
                                    textStyle: Utils.getTitleFont(Colors.white)),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 8, bottom: 0, right: 16),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 12),
                              ),
                              onPressed: () {
                              },
                              child: Center(
                                child: Text(
                                  'Forgot your password',
                                  textAlign: TextAlign.center,
                                  style: Utils.getTitleFont(appColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
