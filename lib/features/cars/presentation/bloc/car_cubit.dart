import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/car_repository.dart';
import 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  final CarRepository _carRepository;

  CarCubit({required CarRepository carRepository})
    : _carRepository = carRepository,
      super(CarInitial());

  Future<void> getAllCars() async {
    emit(CarLoading());
    try {
      final cars = await _carRepository.getAllCars();
      emit(CarLoaded(cars: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> getAvailableCars() async {
    emit(CarLoading());
    try {
      final cars = await _carRepository.getAvailableCars();
      emit(CarLoaded(cars: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> getFeaturedCars({int limit = 4}) async {
    emit(CarLoading());
    try {
      final cars = await _carRepository.getFeaturedCars(limit: limit);
      emit(CarLoaded(cars: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> getCarsByBrand(String brand) async {
    emit(CarLoading());
    try {
      final cars = await _carRepository.getCarsByBrand(brand);
      emit(CarLoaded(cars: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> getCarById(String id) async {
    emit(CarLoading());
    try {
      final car = await _carRepository.getCarById(id);
      if (car != null) {
        emit(CarDetailLoaded(car: car));
      } else {
        emit(const CarError(message: 'Car not found'));
      }
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> getBrands() async {
    emit(CarLoading());
    try {
      final brands = await _carRepository.getBrands();
      emit(BrandsLoaded(brands: brands));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  void clearError() {
    if (state is CarError) {
      emit(CarInitial());
    }
  }

  void resetAndLoadFeaturedCars({int limit = 4}) {
    emit(CarInitial());
    getFeaturedCars(limit: limit);
  }

  void resetAndLoadAllCars() {
    emit(CarInitial());
    getAllCars();
  }
}
