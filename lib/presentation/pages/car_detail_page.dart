import 'package:car_rental_app/presentation/pages/map_detail_page.dart';
import 'package:car_rental_app/presentation/widgets/CarCard.dart';
import 'package:car_rental_app/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/Car.dart';

class CarDetailPage extends StatelessWidget {
  final Car car;

  const CarDetailPage({super.key, required this.car});

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
          CarCard(car: Car(model: car.model, distance: car.distance, fuelCapacity: car.fuelCapacity, pricePerHour: car.pricePerHour)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
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
                        Text('\$4.53', style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapDetailPage(car: car),),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(20),
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
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(car:  Car(model: car.model+'-1', distance: car.distance+100, fuelCapacity: car.fuelCapacity+5, pricePerHour: car.pricePerHour+100)),
                SizedBox(height: 5,),
                MoreCard(car:  Car(model: car.model+'-2', distance: car.distance+200, fuelCapacity: car.fuelCapacity+10, pricePerHour: car.pricePerHour+200)),
                SizedBox(height: 5,),
                MoreCard(car:  Car(model: car.model+'-3', distance: car.distance+300, fuelCapacity: car.fuelCapacity+15, pricePerHour: car.pricePerHour+300)),
              ],
            ),
          )

        ],
      ),
    );
  }
}
