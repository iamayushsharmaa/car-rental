import 'package:car_rental_app/data/datasource/firebase_car_datasource.dart';
import 'package:car_rental_app/data/repository/car_repository_impl.dart';
import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'domain/repository/car_repository.dart';
import 'domain/usecases/get_cars.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  try{
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance,);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
            () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
    );
    getIt.registerLazySingleton<CarRepository>(
          () => CarRepositoryImpl(dataSource: getIt<FirebaseCarDataSource>())
    );
    getIt.registerLazySingleton<GetCars>(
      () => GetCars(getIt<CarRepository>()),
    );
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  }catch(e){
    throw e;
  }
}