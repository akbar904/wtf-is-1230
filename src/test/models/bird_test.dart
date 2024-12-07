
import 'package:flutter_test/flutter_test.dart';
import 'package:bird_app/models/bird.dart';

void main() {
	group('Bird Model Tests', () {
		test('Bird model should correctly serialize from JSON', () {
			// Arrange
			final Map<String, dynamic> json = {
				'name': 'Sparrow',
				'species': 'Passeridae',
				'age': 2
			};

			// Act
			final bird = Bird.fromJson(json);

			// Assert
			expect(bird.name, 'Sparrow');
			expect(bird.species, 'Passeridae');
			expect(bird.age, 2);
		});

		test('Bird model should correctly serialize to JSON', () {
			// Arrange
			final bird = Bird(name: 'Sparrow', species: 'Passeridae', age: 2);

			// Act
			final json = bird.toJson();

			// Assert
			expect(json, {'name': 'Sparrow', 'species': 'Passeridae', 'age': 2});
		});
		
		test('Bird model should correctly compare equality', () {
			// Arrange
			final bird1 = Bird(name: 'Sparrow', species: 'Passeridae', age: 2);
			final bird2 = Bird(name: 'Sparrow', species: 'Passeridae', age: 2);
			final bird3 = Bird(name: 'Robin', species: 'Turdidae', age: 3);

			// Assert
			expect(bird1 == bird2, isTrue);
			expect(bird1 == bird3, isFalse);
		});
	});
}
