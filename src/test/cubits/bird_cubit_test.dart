
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bird_app/cubits/bird_cubit.dart';
import 'package:bird_app/models/bird.dart';

// Mock class for Bird
class MockBird extends Mock implements Bird {}

void main() {
	group('BirdCubit', () {
		late BirdCubit birdCubit;
		late Bird bird;

		setUp(() {
			birdCubit = BirdCubit();
			bird = MockBird();
		});

		tearDown(() {
			birdCubit.close();
		});

		test('initial state is BirdInitial', () {
			expect(birdCubit.state, equals(BirdInitial()));
		});

		blocTest<BirdCubit, BirdState>(
			'emits [BirdLoading, BirdLoaded] when loadBirds is called',
			build: () => birdCubit,
			act: (cubit) => cubit.loadBirds(),
			expect: () => [BirdLoading(), BirdLoaded(birds: [])],
		);

		blocTest<BirdCubit, BirdState>(
			'emits [BirdLoading, BirdLoaded] with a list of birds when addBird is called',
			build: () => birdCubit,
			act: (cubit) {
				cubit.addBird(bird);
				cubit.loadBirds();
			},
			expect: () => [BirdLoading(), BirdLoaded(birds: [bird])],
		);
	});
}
