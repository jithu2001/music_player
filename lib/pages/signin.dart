import 'package:music_player/Homepage.dart';
import 'package:music_player/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey,
          filled: true,
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email address';
        }
        // Check if the entered email has the right format
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        // Return null if the entered email is valid
        return null;
      },
    );

    final passwordfield = TextFormField(
      autofocus: false,
      controller: passwordcontroller,
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          fillColor: Colors.grey,
          filled: true,
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return 'This field is required';
        }
        if (!regex.hasMatch(value)) {
          return 'Password must be at least 6 characters in length';
        }
        // Return null if the entered password is valid
        return null;
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
              child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(40.0, 110, 0, 0),
                child: Text(
                  "Hello",
                  style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40.0, 175, 0, 0),
                child: Text(
                  "User",
                  style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(200.0, 175, 0, 0),
                child: Text(
                  ".",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
          Container(
            padding: EdgeInsets.all(35),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  emailfield,
                  //.....
                  SizedBox(
                    height: 5,
                  ),
                  passwordfield,
                  //.......
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment(.6, 0),
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 300,
                    height: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.purpleAccent,
                      color: Colors.purple,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          login(emailcontroller.text, passwordcontroller.text);
                        },
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New to App ?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void login(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "login successful"),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
