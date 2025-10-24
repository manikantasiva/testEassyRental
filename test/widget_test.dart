import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_easy_rental/features/cars/presentation/widgets/car_card.dart';
import 'package:test_easy_rental/features/cars/domain/entities/car_entity.dart';

void main() {
  group('CarCard Widget Tests', () {
    late CarEntity mockCar;

    setUp(() {
      mockCar = CarEntity(
        id: '1',
        name: 'Toyota Camry',
        brand: 'Toyota',
        model: 'Camry',
        year: '2023',
        pricePerDay: 2500.0,
        rating: 4.5,
        imageUrl: 'https://example.com/car.jpg',
        description: 'A reliable and comfortable sedan',
        features: ['Air Conditioning', 'Bluetooth', 'GPS'],
        fuelType: 'Petrol',
        transmission: 'Automatic',
        seats: 5,
        color: 'White',
        location: 'Mumbai',
        isAvailable: true,
      );
    });

    testWidgets('should display car information correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CarCard(car: mockCar))),
      );

      expect(find.text('Toyota Camry'), findsOneWidget);
      expect(find.text('Rs \ 2500/Day'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
      expect(find.text('Book Now'), findsOneWidget);
    });

    testWidgets('should display star icon for rating', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CarCard(car: mockCar))),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('should handle tap on card', (WidgetTester tester) async {
      bool onTapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CarCard(
              car: mockCar,
              onTap: () {
                onTapCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CarCard));
      await tester.pump();

      expect(onTapCalled, isTrue);
    });

    testWidgets('should handle tap on Book Now button', (
      WidgetTester tester,
    ) async {
      bool onTapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CarCard(
              car: mockCar,
              onTap: () {
                onTapCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Book Now'));
      await tester.pump();

      expect(onTapCalled, isTrue);
    });

    testWidgets('should handle tap on favorite button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CarCard(car: mockCar))),
      );

      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pump();

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('should display error icon when image fails to load', (
      WidgetTester tester,
    ) async {
      final carWithInvalidImage = mockCar.copyWith(
        imageUrl: 'https://invalid-url.com/image.jpg',
      );

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CarCard(car: carWithInvalidImage))),
      );

      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.directions_car), findsOneWidget);
    });

    testWidgets('should handle long car names with ellipsis', (
      WidgetTester tester,
    ) async {
      final carWithLongName = mockCar.copyWith(
        name: 'Very Long Car Name That Should Be Truncated With Ellipsis',
      );

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CarCard(car: carWithLongName))),
      );

      expect(
        find.text('Very Long Car Name That Should Be Truncated With Ellipsis'),
        findsOneWidget,
      );
    });

    testWidgets('should display correct price format', (
      WidgetTester tester,
    ) async {
      final carWithDecimalPrice = mockCar.copyWith(pricePerDay: 2500.99);

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CarCard(car: carWithDecimalPrice))),
      );

      expect(find.text('Rs \ 2500/Day'), findsOneWidget);
    });

    testWidgets('should work without onTap callback', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CarCard(car: mockCar))),
      );

      expect(find.text('Toyota Camry'), findsOneWidget);
      expect(find.text('Book Now'), findsOneWidget);
    });
  });
}
