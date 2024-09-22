
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bird_app/widgets/bird_list_widget.dart';

void main() {
	group('BirdListWidget', () {
		testWidgets('displays a list of bird widgets', (WidgetTester tester) async {
			// Mock BirdCubit and its state
			final birdCubit = MockBirdCubit();
			when(() => birdCubit.state).thenReturn(BirdLoadedState([
				Bird(name: 'Sparrow', species: 'House Sparrow', age: 1),
				Bird(name: 'Robin', species: 'American Robin', age: 2),
			]));

			// Build the BirdListWidget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<BirdCubit>(
						create: (_) => birdCubit,
						child: BirdListWidget(),
					),
				),
			);

			// Verify if BirdListWidget displays bird items correctly
			expect(find.text('Sparrow'), findsOneWidget);
			expect(find.text('House Sparrow'), findsOneWidget);
			expect(find.text('Robin'), findsOneWidget);
			expect(find.text('American Robin'), findsOneWidget);
		});

		testWidgets('displays loading indicator when state is BirdLoadingState', (WidgetTester tester) async {
			// Mock BirdCubit and its state
			final birdCubit = MockBirdCubit();
			when(() => birdCubit.state).thenReturn(BirdLoadingState());

			// Build the BirdListWidget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<BirdCubit>(
						create: (_) => birdCubit,
						child: BirdListWidget(),
					),
				),
			);

			// Verify if BirdListWidget displays the loading indicator
			expect(find.byType(CircularProgressIndicator), findsOneWidget);
		});

		testWidgets('displays an error message when state is BirdErrorState', (WidgetTester tester) async {
			// Mock BirdCubit and its state
			final birdCubit = MockBirdCubit();
			when(() => birdCubit.state).thenReturn(BirdErrorState('Failed to load birds'));

			// Build the BirdListWidget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<BirdCubit>(
						create: (_) => birdCubit,
						child: BirdListWidget(),
					),
				),
			);

			// Verify if BirdListWidget displays the error message
			expect(find.text('Failed to load birds'), findsOneWidget);
		});
	});
}

// Mock classes
class MockBirdCubit extends MockCubit<BirdState> implements BirdCubit {}
