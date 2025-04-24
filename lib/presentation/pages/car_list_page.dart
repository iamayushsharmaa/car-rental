

import 'package:car_rental_app/data/models/Car.dart';
import 'package:car_rental_app/presentation/widgets/CarCard.dart';
import 'package:flutter/material.dart';

class CarListPage extends StatelessWidget {
  final List<Car> cars = [
    Car(model: 'Model 4', distance: 300.0, fuelCapacity: 10.0, pricePerHour: 96),
    Car(model: 'Model 5', distance: 300.0, fuelCapacity: 10.0, pricePerHour: 45),
    Car(model: 'Model 6', distance: 300.0, fuelCapacity: 10.0, pricePerHour: 90),
    Car(model: 'Model 9', distance: 300.0, fuelCapacity: 10.0, pricePerHour: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: cars.length,
          itemBuilder:(context, index){
            return CarCard(car: cars[index]);
          }
      ),
    );
  }
}

