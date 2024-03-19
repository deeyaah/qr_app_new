import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled2/regpag.dart';
import 'package:untitled2/scan.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController rollno = TextEditingController();
  TextEditingController passsword = TextEditingController();
  Future<void> login() async {
    Uri url = Uri.parse('https://scnner-web.onrender.com/api/login');
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'rollno': rollno.text, 'password': passsword}));
    var dcodeData = jsonDecode(response.body);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Container(
            width: 850,
            child: TextField(
              controller: rollno,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter your roll no',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: 850,
            child: TextField(
              controller: passsword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter your password',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 40),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Scan()),
                );
              },
              child: Text(
                "login",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              )),
          Text('dont have accont?',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Reg()),
                );
              },
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              )),
        ],
      )),
      backgroundColor: Colors.tealAccent,
    );
  }
}
