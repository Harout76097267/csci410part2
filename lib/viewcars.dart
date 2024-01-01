import 'package:flutter/material.dart';
import 'package:project123/cardetails.dart';

class Car {
  final String id;
  final String name;
  final String description;
  final String model;
  final String price;

  Car({required this.id, required this.name, required this.description, required this.model, required this.price});
}

class ViewCarPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars in the Community'),
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
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/${cars[index].name}.jpg',

                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Car ${index + 1} - ${cars[index].name}'),
                    ),
                    SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailsPage(car: cars[index]),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Details',
                            style: TextStyle(color: Colors.white),

                          ),

                        ),

                      ),

                    ),

                  ],


                ),


              );



            },



          ),



        ],




      ),




    );









  }



}

















final List<Car> cars = [
  Car(id: '0', name: 'BMWM3', description: 'Powerful and stylish', model: '2020', price: '85,000 usd'),
  Car(id: '1', name: 'FERRARI', description: 'Luxury and speed', model: '2018', price: '250,000 usd'),
  Car(id: '2', name: 'GOLF7R', description: 'Sporty and compact', model: '2016', price: '75,000 usd'),
  Car(id: '3', name: 'AUDIR8', description: 'Sleek and powerful', model: '2018', price: '80,000 usd' ),
  Car(id: '4', name: 'LAMBOGHINI', description: 'Iconic and fast', model: '2016', price: '200,000 usd'),
  Car(id: '5', name: 'MERCEDES', description: 'Elegant and sophisticated',model: '2020', price: '660,000 usd'),
  Car(id: '6', name: 'ASTONMARTIN', description: 'Classy and refined',model: '2017', price: '70,000 usd'),
  Car(id: '7', name: 'MCLAREN', description: 'High-performance', model: '2017',price: '90,000 usd'),
  // Add details for other cars
];