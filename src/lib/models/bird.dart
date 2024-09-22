
import 'package:equatable/equatable.dart';

class Bird extends Equatable {
	final String name;
	final String species;
	final int age;

	const Bird({
		required this.name,
		required this.species,
		required this.age,
	});

	factory Bird.fromJson(Map<String, dynamic> json) {
		return Bird(
			name: json['name'] as String,
			species: json['species'] as String,
			age: json['age'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'name': name,
			'species': species,
			'age': age,
		};
	}

	@override
	List<Object?> get props => [name, species, age];
}
