
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bird_app/widgets/bird_item_widget.dart';
import 'package:bird_app/models/bird.dart';

class MockBird extends Mock implements Bird {}

void main() {
	group('BirdItemWidget Tests', () {
		testWidgets('displays bird name and species', (WidgetTester tester) async {
			// Arrange
			final bird = Bird(name: 'Sparrow', species: 'Passeridae', age: 2);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BirdItemWidget(bird: bird),
					),
				),
			);

			// Assert
			expect(find.text('Sparrow'), findsOneWidget);
			expect(find.text('Passeridae'), findsOneWidget);
		});

		testWidgets('displays bird age', (WidgetTester tester) async {
			// Arrange
			final bird = Bird(name: 'Sparrow', species: 'Passeridae', age: 2);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BirdItemWidget(bird: bird),
					),
				),
			);

			// Assert
			expect(find.text('Age: 2'), findsOneWidget);
		});
	});
}
