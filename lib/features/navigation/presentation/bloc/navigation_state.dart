part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object?> get props => [];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial();
}

class NavigationTabChanged extends NavigationState {
  final int selectedIndex;

  const NavigationTabChanged(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
