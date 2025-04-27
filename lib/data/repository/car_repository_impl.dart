import 'package:car_rental_app/data/datasource/firebase_car_datasource.dart';
import 'package:car_rental_app/data/models/Car.dart';
import 'package:car_rental_app/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository{

  final FirebaseCarDataSource dataSource;
  CarRepositoryImpl({required this.dataSource});

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}