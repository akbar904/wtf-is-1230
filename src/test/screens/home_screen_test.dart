
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:bird_app/screens/home_screen.dart';
import 'package:bird_app/cubits/bird_cubit.dart';

// Mock classes
class MockBirdCubit extends MockCubit<BirdState> implements BirdCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late MockBirdCubit mockBirdCubit;

		setUp(() {
			mockBirdCubit = MockBirdCubit();
		});

		testWidgets('should display loading indicator when state is BirdLoadingState', (WidgetTester tester) async {
			when(() => mockBirdCubit.state).thenReturn(BirdLoadingState());

			// Build HomeScreen widget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<BirdCubit>(
						create: (context) => mockBirdCubit,
						child: const HomeScreen(),
					),
				),
			);

			expect(find.byType(CircularProgressIndicator), findsOneWidget);
		});

		testWidgets('should display bird list when state is BirdLoadedState', (WidgetTester tester) async {
			final birds = [
				Bird(name: 'Sparrow', species: 'Passeridae', age: 3),
				Bird(name: 'Robin', species: 'Erithacus', age: 2),
			];

			when(() => mockBirdCubit.state).thenReturn(BirdLoadedState(birds));

			// Build HomeScreen widget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<BirdCubit>(
						create: (context) => mockBirdCubit,
						child: const HomeScreen(),
					),
				),
			);

			expect(find.text('Sparrow'), findsOneWidget);
			expect(find.text('Robin'), findsOneWidget);
		});

		testWidgets('should display error message when state is BirdErrorState', (WidgetTester tester) async {
			when(() => mockBirdCubit.state).thenReturn(BirdErrorState('Failed to load birds'));

			// Build HomeScreen widget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<BirdCubit>(
						create: (context) => mockBirdCubit,
						child: const HomeScreen(),
					),
				),
			);

			expect(find.text('Failed to load birds'), findsOneWidget);
		});
	});
}
