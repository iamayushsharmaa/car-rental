import 'package:car_rental_app/data/models/Car.dart';
import 'package:car_rental_app/domain/repository/car_repository.dart';

class GetCars{
  final CarRepository carRepository;

  GetCars(this.carRepository);

  Future<List<Car>> call() async{
   return await carRepository.fetchCars();
  }
}