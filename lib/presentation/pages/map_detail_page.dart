import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDetailPage extends StatelessWidget {
  const MapDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Map Detail Page'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(51, -0.09),
                initialZoom: 13,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                )
              ]
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: carDetailCard()
          )
        ],
      )
    );
  }
}


Widget carDetailCard(){
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: 0
              ),
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                'car model',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16,),
                  SizedBox(width: 10,),
                  Text(
                    '> car.distance km',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.battery_full, color: Colors.white, size: 14,),
                  SizedBox(width: 5,),
                  Text(
                    'car.fuelCapacity',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),

                ],
              )
            ]
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                  ),
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Features', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  //featureIcons()
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$car.price/day',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      ElevatedButton(
                          onPressed: () {

                            },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                          child: Text('Book Now', style: TextStyle(color: Colors.white),)
                      )
                    ],
                  ),
                ],
              ),
            )
        ),
      ],
    ),
  );
}


Widget featureIcons(){
  return Row();
}