

import 'package:bloc/bloc.dart';
import 'package:car_rental_app/data/models/Car.dart';
import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/presentation/bloc/car_states.dart';
import 'package:car_rental_app/presentation/widgets/CarCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        title: Text('Choose Your Car'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CarBloc, CarStates>(
          builder: (context, state) {
            if (state is CarsLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is CarsLoaded){
              return ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return CarCard(car: cars[index]);
                },
              );
            }
            else if(state is CarsError){
              return Center(
                child: Text('Error : ${state.message}'),
              );
            }
            return Container();
          },
      ),
    );
  }
}

