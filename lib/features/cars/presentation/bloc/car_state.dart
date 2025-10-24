import 'package:equatable/equatable.dart';
import '../../domain/entities/car_entity.dart';

abstract class CarState extends Equatable {
  const CarState();

  @override
  List<Object?> get props => [];
}

class CarInitial extends CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<CarEntity> cars;

  const CarLoaded({required this.cars});

  @override
  List<Object> get props => [cars];
}

class CarError extends CarState {
  final String message;

  const CarError({required this.message});

  @override
  List<Object> get props => [message];
}

class CarDetailLoaded extends CarState {
  final CarEntity car;

  const CarDetailLoaded({required this.car});

  @override
  List<Object> get props => [car];
}

class BrandsLoaded extends CarState {
  final List<String> brands;

  const BrandsLoaded({required this.brands});

  @override
  List<Object> get props => [brands];
}
