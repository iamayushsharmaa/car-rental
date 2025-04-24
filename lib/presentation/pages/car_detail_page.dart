import 'package:car_rental_app/presentation/widgets/CarCard.dart';
import 'package:flutter/material.dart';

import '../../data/models/Car.dart';

class CarDetailPage extends StatelessWidget {
  const CarDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(' Information'),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(car: Car(model: 'Model 4', distance: 300.0, fuelCapacity: 10.0, pricePerHour: 96)),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5
                )
              ]
            ),
            child: Column(
              children: [
                CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/images/user.png')),
                SizedBox(height: 10,),
                Text('Jane Cooper', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('\$4,253', style: TextStyle(color: Colors.grey),)
                ],
            ),
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                image: DecorationImage(
                    image: AssetImage('assets/images/maps.png'),
                    fit: BoxFit.cover
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}
