import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/booking_repository.dart';
import '../../domain/entities/booking_form_entity.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository _bookingRepository;

  BookingCubit({required BookingRepository bookingRepository})
    : _bookingRepository = bookingRepository,
      super(BookingInitial());

  void initializeForm(String carId, String carName, {String? customerName}) {
    final form = BookingFormEntity(
      carId: carId,
      carName: carName,
      customerName: customerName ?? '',
    );
    emit(BookingFormLoaded(form: form));
  }

  void updateCustomerName(String name) {
    final currentState = state;
    if (currentState is BookingFormLoaded) {
      final updatedForm = currentState.form.copyWith(customerName: name);
      emit(BookingFormLoaded(form: updatedForm));
    }
  }

  void updateFromDate(DateTime date) {
    final currentState = state;
    if (currentState is BookingFormLoaded) {
      final updatedForm = currentState.form.copyWith(fromDate: date);
      emit(BookingFormLoaded(form: updatedForm));
    }
  }

  void updateToDate(DateTime? date) {
    final currentState = state;
    if (currentState is BookingFormLoaded) {
      final updatedForm = currentState.form.copyWith(toDate: date);
      emit(BookingFormLoaded(form: updatedForm));
    }
  }

  void updateFromTime(String time) {
    final currentState = state;
    if (currentState is BookingFormLoaded) {
      final updatedForm = currentState.form.copyWith(fromTime: time);
      emit(BookingFormLoaded(form: updatedForm));
    }
  }

  void updateToTime(String time) {
    final currentState = state;
    if (currentState is BookingFormLoaded) {
      final updatedForm = currentState.form.copyWith(toTime: time);
      emit(BookingFormLoaded(form: updatedForm));
    }
  }

  void updateLocation(String location) {
    final currentState = state;
    if (currentState is BookingFormLoaded) {
      final updatedForm = currentState.form.copyWith(location: location);
      emit(BookingFormLoaded(form: updatedForm));
    }
  }

  void toggleSingleDay(bool isSingleDay) {
    final currentState = state;
    if (currentState is BookingFormLoaded) {
      final updatedForm = currentState.form.copyWith(
        isSingleDay: isSingleDay,
        toDate: isSingleDay ? null : currentState.form.toDate,
      );
      emit(BookingFormLoaded(form: updatedForm));
    }
  }

  Future<void> createBooking() async {
    final currentState = state;
    if (currentState is BookingFormLoaded) {
      if (!currentState.form.isValid) {
        emit(const BookingError(message: 'Please fill in all required fields'));
        return;
      }

      emit(BookingLoading());
      try {
        final booking = await _bookingRepository.createBooking(
          currentState.form,
        );
        emit(BookingCreated(booking: booking));
      } catch (e) {
        emit(BookingError(message: e.toString()));
      }
    }
  }

  void clearError() {
    if (state is BookingError) {
      emit(BookingInitial());
    }
  }
}
