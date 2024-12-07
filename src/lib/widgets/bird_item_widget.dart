
import 'package:flutter/material.dart';
import 'package:bird_app/models/bird.dart';

class BirdItemWidget extends StatelessWidget {
	final Bird bird;

	const BirdItemWidget({Key? key, required this.bird}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ListTile(
			title: Text(bird.name),
			subtitle: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text(bird.species),
					Text('Age: ${bird.age}'),
				],
			),
		);
	}
}
