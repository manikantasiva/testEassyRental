import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'core/navigation/navigation_repository.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/data/repositories/splash_repository.dart';
import 'features/auth/presentation/bloc/auth_cubit.dart';
import 'features/auth/presentation/bloc/splash_cubit.dart';
import 'features/navigation/presentation/bloc/navigation_cubit.dart';
import 'features/cars/data/repositories/car_repository.dart';
import 'features/cars/presentation/bloc/car_cubit.dart';
import 'features/cars/presentation/bloc/car_details_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AuthCubit(
                authRepository: AuthRepositoryImpl(),
                navigationRepository: NavigationRepositoryImpl(),
              ),
        ),
        BlocProvider(
          create:
              (context) => SplashCubit(
                splashRepository: SplashRepositoryImpl(
                  authRepository: AuthRepositoryImpl(),
                  navigationRepository: NavigationRepositoryImpl(),
                ),
              ),
        ),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(
          create: (context) => CarCubit(carRepository: CarRepositoryImpl()),
        ),
        BlocProvider(
          create:
              (context) => CarDetailsCubit(carRepository: CarRepositoryImpl()),
        ),
      ],
      child: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<AuthCubit>().checkAuthStatus();
          });

          return MaterialApp.router(
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            routerConfig: AppRouter.createRouter(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
