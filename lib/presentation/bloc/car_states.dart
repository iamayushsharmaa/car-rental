
import 'package:car_rental_app/data/models/Car.dart';

abstract class CarStates{}

class CarsLoading extends CarStates{}

class CarsLoaded extends CarStates {
  final List<Car> cars;
  CarsLoaded(this.cars);
}

class CarsError extends CarStates{
  final String message;
  CarsError(this.message);
}

