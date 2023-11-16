import 'package:flutter/material.dart';
import 'package:gptapp/views/chatscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              child: Text(
                "Welcome to ChatGPT",
                style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey.shade400)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("lib/assets/logo.png"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              child: Text(
                "Tap to Continue!",
                style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
