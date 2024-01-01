import 'package:flutter/material.dart';
import 'package:project123/viewcars.dart';

class CarDetailsPage extends StatelessWidget {
  final Car car;

  CarDetailsPage({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/car12.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Below is the details of the selected car',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                SizedBox(height: 16.0),
                Text(
                  'ID: ${car.id}',
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
                Text(
                  'Name: ${car.name}',
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
                Text(
                  'Description: ${car.description}',
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
                Text(
                  'Model: ${car.model}',
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
                Text(
                  'Price: ${car.price}',
                  style: TextStyle(color: Colors.black,fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
