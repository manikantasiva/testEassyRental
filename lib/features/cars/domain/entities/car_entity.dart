import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final String id;
  final String name;
  final String brand;
  final String model;
  final String imageUrl;
  final double rating;
  final String location;
  final int seats;
  final double pricePerDay;
  final String fuelType;
  final String transmission;
  final String year;
  final String color;
  final List<String> features;
  final bool isAvailable;
  final String description;

  const CarEntity({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.seats,
    required this.pricePerDay,
    required this.fuelType,
    required this.transmission,
    required this.year,
    required this.color,
    required this.features,
    required this.isAvailable,
    required this.description,
  });

  factory CarEntity.fromJson(Map<String, dynamic> json) {
    return CarEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      location: json['location'] as String,
      seats: json['seats'] as int,
      pricePerDay: (json['pricePerDay'] as num).toDouble(),
      fuelType: json['fuelType'] as String,
      transmission: json['transmission'] as String,
      year: json['year'] as String,
      color: json['color'] as String,
      features: List<String>.from(json['features'] as List),
      isAvailable: json['isAvailable'] as bool,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'model': model,
      'imageUrl': imageUrl,
      'rating': rating,
      'location': location,
      'seats': seats,
      'pricePerDay': pricePerDay,
      'fuelType': fuelType,
      'transmission': transmission,
      'year': year,
      'color': color,
      'features': features,
      'isAvailable': isAvailable,
      'description': description,
    };
  }

  CarEntity copyWith({
    String? id,
    String? name,
    String? brand,
    String? model,
    String? imageUrl,
    double? rating,
    String? location,
    int? seats,
    double? pricePerDay,
    String? fuelType,
    String? transmission,
    String? year,
    String? color,
    List<String>? features,
    bool? isAvailable,
    String? description,
  }) {
    return CarEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      location: location ?? this.location,
      seats: seats ?? this.seats,
      pricePerDay: pricePerDay ?? this.pricePerDay,
      fuelType: fuelType ?? this.fuelType,
      transmission: transmission ?? this.transmission,
      year: year ?? this.year,
      color: color ?? this.color,
      features: features ?? this.features,
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    brand,
    model,
    imageUrl,
    rating,
    location,
    seats,
    pricePerDay,
    fuelType,
    transmission,
    year,
    color,
    features,
    isAvailable,
    description,
  ];
}
