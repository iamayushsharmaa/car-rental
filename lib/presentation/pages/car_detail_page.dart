import 'package:car_rental_app/presentation/pages/map_detail_page.dart';
import 'package:car_rental_app/presentation/widgets/CarCard.dart';
import 'package:car_rental_app/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/Car.dart';

class CarDetailPage extends StatefulWidget {
  final Car car;

  const CarDetailPage({super.key, required this.car});

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> with SingleTickerProviderStateMixin{
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this
    );
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
    ..addListener((){setState(() {

    }); });

    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

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
          CarCard(car: Car(model: widget.car.model, distance: widget.car.distance, fuelCapacity: widget.car.fuelCapacity, pricePerHour: widget.car.pricePerHour)),
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
                        MaterialPageRoute(builder: (context) => MapDetailPage(car: widget.car),),
                      );
                    },
                    child: Container(
                      height: 170,
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/maps.png', fit: BoxFit.cover,),
                        ),
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
                MoreCard(car:  Car(model: widget.car.model+'-1', distance: widget.car.distance+100, fuelCapacity: widget.car.fuelCapacity+5, pricePerHour: widget.car.pricePerHour+100)),
                SizedBox(height: 5,),
                MoreCard(car:  Car(model: widget.car.model+'-2', distance: widget.car.distance+200, fuelCapacity: widget.car.fuelCapacity+10, pricePerHour: widget.car.pricePerHour+200)),
                SizedBox(height: 5,),
                MoreCard(car:  Car(model: widget.car.model+'-3', distance: widget.car.distance+300, fuelCapacity: widget.car.fuelCapacity+15, pricePerHour: widget.car.pricePerHour+300)),
              ],
            ),
          )

        ],
      ),
    );
  }
}
