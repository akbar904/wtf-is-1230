
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bird_app/main.dart';
import 'package:bird_app/cubits/bird_cubit.dart';
import 'package:bird_app/screens/home_screen.dart';

class MockBirdCubit extends MockCubit<BirdState> implements BirdCubit {}

void main() {
	group('Main app initialization', () {
		testWidgets('App should display HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('BirdCubit', () {
		late BirdCubit birdCubit;

		setUp(() {
			birdCubit = MockBirdCubit();
		});

		blocTest<BirdCubit, BirdState>(
			'emits BirdLoadingState and then BirdLoadedState when loadBirds is called',
			build: () => birdCubit,
			act: (cubit) => cubit.loadBirds(),
			expect: () => [isA<BirdLoadingState>(), isA<BirdLoadedState>()],
		);

		blocTest<BirdCubit, BirdState>(
			'emits BirdLoadedState when addBird is called',
			build: () => birdCubit,
			act: (cubit) => cubit.addBird(Bird(name: 'Parrot', species: 'Psittacidae', age: 2)),
			expect: () => [isA<BirdLoadedState>()],
		);
	});
}
