import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gptapp/firebase/firebaseAuth.dart';
import 'package:gptapp/views/chatscreen.dart';
import 'package:gptapp/views/homescreen.dart';
import 'package:gptapp/views/singup.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("lib/assets/logo.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade300)),
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (value!.isEmpty) {
                                return "Enter E-mail Please";
                              } else if (!emailValid) {
                                return "Enter Valid E-mail";
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade300)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password Please!";
                              } else if (passwordController.text.length < 8) {
                                return "Password Lenght Shouldn't be less than 8 characters";
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade500, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextButton(
                          onPressed: () {
                            _signin();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 25,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey.shade200),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.grey.shade400),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signin() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("LOGGED IN SUCCESSFULLY!");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      Fluttertoast.showToast(
        msg: "Logged In",
        toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
        gravity:
            ToastGravity.BOTTOM, // You can set the toast gravity (position)

        backgroundColor: Colors.green.shade300, // Background color of the toast
        textColor: Colors.white, // Text color of the toast
        fontSize: 16.0, // Font size
      );
    } else {
      Fluttertoast.showToast(
        msg: "Invalid Login",
        toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
        gravity:
            ToastGravity.BOTTOM, // You can set the toast gravity (position)

        backgroundColor: Colors.red.shade600, // Background color of the toast
        textColor: Colors.white, // Text color of the toast
        fontSize: 16.0, // Font size
      );
      print("Error Occured");
    }
  }
}
