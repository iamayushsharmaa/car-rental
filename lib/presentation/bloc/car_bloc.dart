import 'package:bloc/bloc.dart';
import 'package:car_rental_app/presentation/bloc/car_event.dart';
import 'package:car_rental_app/presentation/bloc/car_states.dart';

import '../../domain/usecases/get_cars.dart';

class CarBloc extends Bloc<CarEvent, CarStates>{
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()){
    on<LoadCars>((event, emit) async{
      emit(CarsLoading());
      try{
        final cars = await getCars.call();
        emit(CarsLoaded(cars));

      }catch(e){
        emit(CarsError(e.toString()));
      }
    });
  }

}