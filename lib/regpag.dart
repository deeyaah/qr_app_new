import 'dart:convert';

import 'package:flutter/material.dart';
import 'loginpg.dart';
import 'package:http/http.dart' as http;

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  final _rolNoController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future<void> register() async {
    print(_emailController.text);
    print(_passwordController.text);
    print(_rolNoController.text);
    print(_nameController.text);
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/register');
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          'name': _nameController.text,
          'email': _emailController.text,
          'rollno': _rolNoController.text,
          'password': _passwordController.text,



        }));
    print(response.statusCode);
    print(response.body);
    var data = jsonDecode(response.body);
    print(data["message"]);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(
            'registration',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Container(
            width: 850,
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter your name',
                hintStyle: TextStyle(color: Colors.teal),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: 850,
            child: TextField(
              controller: _rolNoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter your roll no',
                hintStyle: TextStyle(color: Colors.teal),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: 850,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter your email',
                hintStyle: TextStyle(color: Colors.teal),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: 850,
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter your password',
                hintStyle: TextStyle(color: Colors.teal),
              )
            ),
          ),
          SizedBox(height: 40),
          SizedBox(height: 40),
          TextButton(
              onPressed: () {
                register();
              },
              child: Text(
                "register",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.teal,
                  fontWeight: FontWeight.w800,
                ),
              )),
        ],
      )),
    );
  }
}
