import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/car_repository.dart';
import '../../domain/entities/car_entity.dart';

// Dedicated states for car details
abstract class CarDetailsState {}

class CarDetailsInitial extends CarDetailsState {}

class CarDetailsLoading extends CarDetailsState {}

class CarDetailsLoaded extends CarDetailsState {
  final CarEntity car;
  CarDetailsLoaded({required this.car});
}

class CarDetailsError extends CarDetailsState {
  final String message;
  CarDetailsError({required this.message});
}

// Dedicated cubit for car details only
class CarDetailsCubit extends Cubit<CarDetailsState> {
  final CarRepository _carRepository;

  CarDetailsCubit({required CarRepository carRepository})
    : _carRepository = carRepository,
      super(CarDetailsInitial());

  Future<void> getCarById(String id) async {
    emit(CarDetailsLoading());
    try {
      final car = await _carRepository.getCarById(id);
      if (car != null) {
        emit(CarDetailsLoaded(car: car));
      } else {
        emit(CarDetailsError(message: 'Car not found'));
      }
    } catch (e) {
      emit(CarDetailsError(message: e.toString()));
    }
  }
}
