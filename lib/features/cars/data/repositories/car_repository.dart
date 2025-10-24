import '../../domain/entities/car_entity.dart';
import '../../../../core/services/cars_mock_service.dart';

abstract class CarRepository {
  Future<List<CarEntity>> getAllCars();
  Future<List<CarEntity>> getAvailableCars();
  Future<List<CarEntity>> getFeaturedCars({int limit = 4});
  Future<List<CarEntity>> getCarsByBrand(String brand);
  Future<CarEntity?> getCarById(String id);
  Future<List<String>> getBrands();
}

class CarRepositoryImpl implements CarRepository {
  CarRepositoryImpl();

  @override
  Future<List<CarEntity>> getAllCars() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return CarsMockService.getAllCars();
    } catch (e) {
      throw Exception('Failed to fetch all cars: ${e.toString()}');
    }
  }

  @override
  Future<List<CarEntity>> getAvailableCars() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return CarsMockService.getAvailableCars();
    } catch (e) {
      throw Exception('Failed to fetch available cars: ${e.toString()}');
    }
  }

  @override
  Future<List<CarEntity>> getFeaturedCars({int limit = 4}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return CarsMockService.getFeaturedCars(limit: limit);
    } catch (e) {
      throw Exception('Failed to fetch featured cars: ${e.toString()}');
    }
  }

  @override
  Future<List<CarEntity>> getCarsByBrand(String brand) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return CarsMockService.getCarsByBrand(brand);
    } catch (e) {
      throw Exception('Failed to fetch cars by brand: ${e.toString()}');
    }
  }

  @override
  Future<CarEntity?> getCarById(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      return CarsMockService.getCarById(id);
    } catch (e) {
      throw Exception('Failed to fetch car by id: ${e.toString()}');
    }
  }

  @override
  Future<List<String>> getBrands() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      return CarsMockService.getBrands();
    } catch (e) {
      throw Exception('Failed to fetch brands: ${e.toString()}');
    }
  }
}
