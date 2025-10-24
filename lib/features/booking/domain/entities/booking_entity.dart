import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String id;
  final String carId;
  final String carName;
  final String customerName;
  final DateTime fromDate;
  final DateTime toDate;
  final String fromTime;
  final String toTime;
  final String location;
  final double totalPrice;
  final String status;
  final DateTime createdAt;

  const BookingEntity({
    required this.id,
    required this.carId,
    required this.carName,
    required this.customerName,
    required this.fromDate,
    required this.toDate,
    required this.fromTime,
    required this.toTime,
    required this.location,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
    id,
    carId,
    carName,
    customerName,
    fromDate,
    toDate,
    fromTime,
    toTime,
    location,
    totalPrice,
    status,
    createdAt,
  ];

  BookingEntity copyWith({
    String? id,
    String? carId,
    String? carName,
    String? customerName,
    DateTime? fromDate,
    DateTime? toDate,
    String? fromTime,
    String? toTime,
    String? location,
    double? totalPrice,
    String? status,
    DateTime? createdAt,
  }) {
    return BookingEntity(
      id: id ?? this.id,
      carId: carId ?? this.carId,
      carName: carName ?? this.carName,
      customerName: customerName ?? this.customerName,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      location: location ?? this.location,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
