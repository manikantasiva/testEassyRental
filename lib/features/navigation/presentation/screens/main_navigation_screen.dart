import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_cubit.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../home/presentation/screens/bookings_screen.dart';
import '../../../home/presentation/screens/profile_screen.dart';
import '../../../home/presentation/screens/notifications_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentState = context.read<NavigationCubit>().state;
      if (currentState is NavigationInitial) {
        context.read<NavigationCubit>().selectTab(0);
      }
    });

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        int selectedIndex = 0;
        if (state is NavigationTabChanged) {
          selectedIndex = state.selectedIndex;
        }

        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: const [
              HomeScreen(),
              BookingsScreen(),
              ProfileScreen(),
              NotificationsScreen(),
            ],
          ),
          bottomNavigationBar: CustomBottomNavigation(
            selectedIndex: selectedIndex,
            onTap: (index) {
              context.read<NavigationCubit>().selectTab(index);
            },
          ),
        );
      },
    );
  }
}
