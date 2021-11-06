import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_player/data/usermodel.dart';
import 'package:music_player/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:music_player/pages/top_hits.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController secondnamecontroller =
      new TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final namefield = TextFormField(
      autofocus: false,
      controller: namecontroller,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey,
          filled: true,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          hintStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return 'Name cannot be empty';
        }
        if (!regex.hasMatch(value)) {
          return 'Name must be at least 3 characters in length';
        }
        // Return null if the entered password is valid
        return null;
      },
    );
    final secondnamefield = TextFormField(
      autofocus: false,
      controller: secondnamecontroller,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.grey,
          filled: true,
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          hintStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return 'Second Name cannot be empty';
        }
        if (!regex.hasMatch(value)) {
          return 'Second Name must be at least 3 characters in length';
        }
        // Return null if the entered password is valid
        return null;
      },
    );
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
    final confirmpasswordfield = TextFormField(
      autofocus: false,
      controller: confirmpasswordcontroller,
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          fillColor: Colors.grey,
          filled: true,
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          hintStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      obscureText: true,
      validator: (value) {
        if (confirmpasswordcontroller.text != passwordcontroller.text) {
          return 'password does not match';
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
          Container(
              child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(40.0, 80, 0, 0),
                child: Text(
                  "Create Account ",
                  style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
          SizedBox(
            height: 35,
          ),
          Container(
            padding: EdgeInsets.all(35),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  namefield,
                  SizedBox(
                    height: 20,
                  ),
                  secondnamefield,
                  SizedBox(
                    height: 20,
                  ),
                  emailfield,
                  SizedBox(
                    height: 20,
                  ),
                  passwordfield,
                  SizedBox(
                    height: 20,
                  ),
                  confirmpasswordfield,
                  SizedBox(
                    height: 35,
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
                          logup(emailcontroller.text, passwordcontroller.text);
                        },
                        child: Center(
                          child: Text(
                            "SIGN UP",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Registered ?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signin()));
                },
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void logup(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    Usermodel usermodel = Usermodel();
    usermodel.email = user!.email;
    usermodel.uid = user.uid;
    usermodel.name = namecontroller.text;
    usermodel.secondname = secondnamecontroller.text;
    await firebasefirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully:)");

    Navigator.push(context, MaterialPageRoute(builder: (context) => Tophits()));
  }
}
