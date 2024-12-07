
import 'package:flutter_test/flutter_test.dart';
import 'package:bird_app/screens/bird_screen.dart';

void main() {
	group('BirdScreen Widget Tests', () {
		testWidgets('displays bird name and species', (WidgetTester tester) async {
			// Arrange
			final bird = Bird(name: 'Sparrow', species: 'Passeridae', age: 2);
			await tester.pumpWidget(
				MaterialApp(
					home: BirdScreen(bird: bird),
				),
			);

			// Act & Assert
			expect(find.text('Sparrow'), findsOneWidget);
			expect(find.text('Species: Passeridae'), findsOneWidget);
		});

		testWidgets('displays bird age', (WidgetTester tester) async {
			// Arrange
			final bird = Bird(name: 'Robin', species: 'Muscicapidae', age: 3);
			await tester.pumpWidget(
				MaterialApp(
					home: BirdScreen(bird: bird),
				),
			);

			// Act & Assert
			expect(find.text('Age: 3 years'), findsOneWidget);
		});
	});
}
