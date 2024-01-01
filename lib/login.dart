import 'package:flutter/material.dart';
import 'package:project123/viewcars.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  String get d => d;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<void> login() async {
    var url = Uri.http("harouttutunjian77.000webhostapp.com", 'check_username.php');
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = response.body;
    var d = data;
    if (data == "Success") {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewCarPage(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Username and password invalid',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/car12.jpg'), // Replace with your image asset
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.dstATop,
              )
            ),
           // Adjust the opacity as needed
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 150,
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(hintText: 'Username'),
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  style: TextStyle(fontStyle: FontStyle.italic),
                  onChanged: (pass) {},
                ),
              ),
              SizedBox(height: 30),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
