import 'package:equatable/equatable.dart';

class BookingFormEntity extends Equatable {
  final String carId;
  final String carName;
  final String customerName;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String fromTime;
  final String toTime;
  final String location;
  final bool isSingleDay;

  const BookingFormEntity({
    required this.carId,
    required this.carName,
    this.customerName = '',
    this.fromDate,
    this.toDate,
    this.fromTime = '09:00',
    this.toTime = '18:00',
    this.location = '',
    this.isSingleDay = true,
  });

  @override
  List<Object?> get props => [
    carId,
    carName,
    customerName,
    fromDate,
    toDate,
    fromTime,
    toTime,
    location,
    isSingleDay,
  ];

  BookingFormEntity copyWith({
    String? carId,
    String? carName,
    String? customerName,
    DateTime? fromDate,
    DateTime? toDate,
    String? fromTime,
    String? toTime,
    String? location,
    bool? isSingleDay,
  }) {
    return BookingFormEntity(
      carId: carId ?? this.carId,
      carName: carName ?? this.carName,
      customerName: customerName ?? this.customerName,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      location: location ?? this.location,
      isSingleDay: isSingleDay ?? this.isSingleDay,
    );
  }

  bool get isValid {
    return customerName.isNotEmpty &&
        location.isNotEmpty &&
        fromDate != null &&
        (!isSingleDay ? toDate != null : true);
  }

  double calculateTotalPrice(double pricePerDay) {
    if (isSingleDay) {
      return pricePerDay;
    } else {
      final days = toDate!.difference(fromDate!).inDays + 1;
      return pricePerDay * days;
    }
  }
}
