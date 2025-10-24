import '../../domain/entities/booking_entity.dart';
import '../../domain/entities/booking_form_entity.dart';

abstract class BookingRepository {
  Future<BookingEntity> createBooking(BookingFormEntity bookingForm);
}

class BookingRepositoryImpl implements BookingRepository {
  BookingRepositoryImpl();

  @override
  Future<BookingEntity> createBooking(BookingFormEntity bookingForm) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));

      final bookingId = 'booking_${DateTime.now().millisecondsSinceEpoch}';

      final booking = BookingEntity(
        id: bookingId,
        carId: bookingForm.carId,
        carName: bookingForm.carName,
        customerName: bookingForm.customerName,
        fromDate: bookingForm.fromDate!,
        toDate:
            bookingForm.isSingleDay
                ? bookingForm.fromDate!
                : bookingForm.toDate!,
        fromTime: bookingForm.fromTime,
        toTime: bookingForm.toTime,
        location: bookingForm.location,
        totalPrice: bookingForm.calculateTotalPrice(
          100.0,
        ), 
        status: 'confirmed',
        createdAt: DateTime.now(),
      );

      return booking;
    } catch (e) {
      throw Exception('Failed to create booking: ${e.toString()}');
    }
  }
}
