import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/splash_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepository _splashRepository;

  SplashCubit({required SplashRepository splashRepository})
    : _splashRepository = splashRepository,
      super(SplashInitial());

  Future<void> checkAuthAndNavigate(dynamic context) async {
    emit(SplashLoading());
    try {
      await _splashRepository.checkAuthAndNavigate(context);
      emit(SplashCompleted());
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}
