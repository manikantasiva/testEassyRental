import '../../features/cars/domain/entities/car_entity.dart';

class CarsMockService {
  static final List<Map<String, dynamic>> _mockCars = [
    {
      'id': 'car1',
      'name': 'Maruti Swift',
      'brand': 'Maruti Suzuki',
      'model': 'Swift',
      'imageUrl':
          'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=500',
      'rating': 4.5,
      'location': 'Hyderabad, HITEC City',
      'seats': 5,
      'pricePerDay': 25.0,
      'fuelType': 'Petrol',
      'transmission': 'Manual',
      'year': '2023',
      'color': 'White',
      'features': ['AC', 'Power Steering', 'Music System', 'Central Locking'],
      'isAvailable': true,
      'description':
          'Popular hatchback with excellent fuel efficiency and reliability.',
    },
    {
      'id': 'car2',
      'name': 'Hyundai Creta',
      'brand': 'Hyundai',
      'model': 'Creta',
      'imageUrl':
          'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=500',
      'rating': 4.7,
      'location': 'Hyderabad, Banjara Hills',
      'seats': 5,
      'pricePerDay': 35.0,
      'fuelType': 'Petrol',
      'transmission': 'Automatic',
      'year': '2023',
      'color': 'Silver',
      'features': ['Touchscreen', 'Reverse Camera', 'Sunroof', 'Bluetooth'],
      'isAvailable': true,
      'description': 'Stylish SUV with modern features and comfortable ride.',
    },
    {
      'id': 'car3',
      'name': 'Honda City',
      'brand': 'Honda',
      'model': 'City',
      'imageUrl':
          'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=500',
      'rating': 4.6,
      'location': 'Hyderabad, Secunderabad',
      'seats': 5,
      'pricePerDay': 30.0,
      'fuelType': 'Petrol',
      'transmission': 'Manual',
      'year': '2023',
      'color': 'Black',
      'features': [
        'LED Headlights',
        'Touchscreen',
        'Climate Control',
        'Safety Kit',
      ],
      'isAvailable': true,
      'description': 'Premium sedan with advanced safety features and comfort.',
    },
    {
      'id': 'car4',
      'name': 'Tata Nexon',
      'brand': 'Tata',
      'model': 'Nexon',
      'imageUrl':
          'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=500',
      'rating': 4.4,
      'location': 'Tirupathi, Temple Area',
      'seats': 5,
      'pricePerDay': 28.0,
      'fuelType': 'Diesel',
      'transmission': 'Manual',
      'year': '2023',
      'color': 'Blue',
      'features': [
        'Touchscreen',
        'Climate Control',
        'Safety Kit',
        'Music System',
      ],
      'isAvailable': true,
      'description':
          'Compact SUV with modern design and efficient performance.',
    },
    {
      'id': 'car5',
      'name': 'Mahindra XUV300',
      'brand': 'Mahindra',
      'model': 'XUV300',
      'imageUrl':
          'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=500',
      'rating': 4.3,
      'location': 'Tirupathi, Railway Station',
      'seats': 5,
      'pricePerDay': 32.0,
      'fuelType': 'Diesel',
      'transmission': 'Manual',
      'year': '2023',
      'color': 'Red',
      'features': ['Touchscreen', 'Climate Control', 'Safety Kit', 'Bluetooth'],
      'isAvailable': true,
      'description':
          'Feature-rich SUV with excellent build quality and safety.',
    },
    {
      'id': 'car6',
      'name': 'Kia Seltos',
      'brand': 'Kia',
      'model': 'Seltos',
      'imageUrl':
          'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=500',
      'rating': 4.8,
      'location': 'Tirupathi, Bus Stand',
      'seats': 5,
      'pricePerDay': 40.0,
      'fuelType': 'Petrol',
      'transmission': 'Automatic',
      'year': '2023',
      'color': 'White',
      'features': ['Sunroof', 'Touchscreen', 'Climate Control', 'Safety Kit'],
      'isAvailable': true,
      'description':
          'Premium SUV with cutting-edge technology and luxury features.',
    },
    {
      'id': 'car7',
      'name': 'Toyota Innova Crysta',
      'brand': 'Toyota',
      'model': 'Innova Crysta',
      'imageUrl':
          'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=500',
      'rating': 4.9,
      'location': 'Visakhapatnam, Beach Road',
      'seats': 7,
      'pricePerDay': 45.0,
      'fuelType': 'Diesel',
      'transmission': 'Manual',
      'year': '2023',
      'color': 'Silver',
      'features': ['AC', 'Power Steering', 'Music System', 'Safety Kit'],
      'isAvailable': true,
      'description':
          'Spacious MPV perfect for family trips with comfort and reliability.',
    },
    {
      'id': 'car8',
      'name': 'Ford EcoSport',
      'brand': 'Ford',
      'model': 'EcoSport',
      'imageUrl':
          'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=500',
      'rating': 4.2,
      'location': 'Visakhapatnam, Port Area',
      'seats': 5,
      'pricePerDay': 33.0,
      'fuelType': 'Petrol',
      'transmission': 'Manual',
      'year': '2023',
      'color': 'Orange',
      'features': ['Touchscreen', 'Climate Control', 'Safety Kit', 'Bluetooth'],
      'isAvailable': true,
      'description':
          'Compact SUV with sporty design and efficient performance.',
    },
    {
      'id': 'car9',
      'name': 'Volkswagen Polo',
      'brand': 'Volkswagen',
      'model': 'Polo',
      'imageUrl':
          'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=500',
      'rating': 4.5,
      'location': 'Bangalore, Electronic City',
      'seats': 5,
      'pricePerDay': 35.0,
      'fuelType': 'Petrol',
      'transmission': 'Manual',
      'year': '2023',
      'color': 'White',
      'features': [
        'Touchscreen',
        'Climate Control',
        'Safety Kit',
        'Music System',
      ],
      'isAvailable': true,
      'description':
          'German engineering with premium build quality and performance.',
    },
    {
      'id': 'car10',
      'name': 'Nissan Magnite',
      'brand': 'Nissan',
      'model': 'Magnite',
      'imageUrl':
          'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=500',
      'rating': 4.1,
      'location': 'Bangalore, Koramangala',
      'seats': 5,
      'pricePerDay': 30.0,
      'fuelType': 'Petrol',
      'transmission': 'Manual',
      'year': '2023',
      'color': 'Red',
      'features': ['Touchscreen', 'Climate Control', 'Safety Kit', 'Bluetooth'],
      'isAvailable': true,
      'description':
          'Compact SUV with modern design and value-for-money features.',
    },
  ];

  static List<CarEntity> getAllCars() {
    try {
      return _mockCars.map((carData) => CarEntity.fromJson(carData)).toList();
    } catch (e) {
      throw Exception('Failed to load cars data: ${e.toString()}');
    }
  }

  static List<CarEntity> getAvailableCars() {
    try {
      return _mockCars
          .where((car) => car['isAvailable'] == true)
          .map((carData) => CarEntity.fromJson(carData))
          .toList();
    } catch (e) {
      throw Exception('Failed to load available cars: ${e.toString()}');
    }
  }

  static List<CarEntity> getCarsByBrand(String brand) {
    try {
      return _mockCars
          .where((car) => car['brand'].toLowerCase() == brand.toLowerCase())
          .map((carData) => CarEntity.fromJson(carData))
          .toList();
    } catch (e) {
      throw Exception('Failed to load cars by brand: ${e.toString()}');
    }
  }

  static CarEntity? getCarById(String id) {
    try {
      final carData = _mockCars.firstWhere(
        (car) => car['id'] == id,
        orElse: () => throw Exception('Car not found'),
      );
      return CarEntity.fromJson(carData);
    } catch (e) {
      return null;
    }
  }

  static List<CarEntity> getFeaturedCars({int limit = 4}) {
    try {
      final availableCars = getAvailableCars();
      availableCars.sort((a, b) => b.rating.compareTo(a.rating));
      return availableCars.take(limit).toList();
    } catch (e) {
      throw Exception('Failed to load featured cars: ${e.toString()}');
    }
  }

  static List<String> getBrands() {
    try {
      return _mockCars.map((car) => car['brand'] as String).toSet().toList();
    } catch (e) {
      throw Exception('Failed to load brands: ${e.toString()}');
    }
  }
}
