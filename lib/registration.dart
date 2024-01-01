import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project123/login.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _errorMessage = '';
  bool _registrationSuccessful = false;

  Future<bool> _register() async {
    // Access the values entered by the user in the text fields
    String username = _usernameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;
    String address = _addressController.text;

    // Check if any of the fields is empty
    if (username.isEmpty || password.isEmpty || email.isEmpty || address.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill in all fields';
      });
      return false;
    }

    // Replace 'your-username' with your actual 000webhost username
    String url = 'https://harouttutunjian77.000webhostapp.com/register.php';

    var response = await http.post(
      Uri.parse(url),
      body: {
        'username': username,
        'password': password,
        'email': email,
        'address': address,
      },
    );

    if (response.statusCode == 200) {
      print('User registered successfully');
      setState(() {
        _errorMessage = 'Registration successful. Thank you!';
      });
      return true;
    } else {
      print('Error registering user: ${response.body}');
      setState(() {
        _errorMessage = 'Registration failed. Please try again.';
      });
      return false;
    }
  }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register below or If You Have An account Please login'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/car12.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      bool registrationSuccessful = await _register();
                      // Show a message after registration
                      if (registrationSuccessful) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Registration successful. Thank you!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: Text('Register'),
                  ),
                  SizedBox(height: 50.0,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Click here to Login '),
                  ),
                  SizedBox(height: 8.0),
                  _registrationSuccessful
                      ? Text(
                    'Thank you for registering! Now, please login.',
                    style: TextStyle(color: Colors.lightGreen),
                  )
                      : Container(),
                  SizedBox(height: 8.0),
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}