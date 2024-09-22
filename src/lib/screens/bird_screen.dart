
import 'package:flutter/material.dart';
import '../models/bird.dart';

class BirdScreen extends StatelessWidget {
	final Bird bird;

	const BirdScreen({Key? key, required this.bird}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(bird.name),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text(
							bird.name,
							style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
						),
						SizedBox(height: 8),
						Text(
							'Species: ${bird.species}',
							style: TextStyle(fontSize: 18),
						),
						SizedBox(height: 8),
						Text(
							'Age: ${bird.age} years',
							style: TextStyle(fontSize: 18),
						),
					],
				),
			),
		);
	}
}
