
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/bird.dart';

// Bird States
abstract class BirdState extends Equatable {
	const BirdState();

	@override
	List<Object> get props => [];
}

class BirdInitial extends BirdState {}

class BirdLoading extends BirdState {}

class BirdLoaded extends BirdState {
	final List<Bird> birds;

	const BirdLoaded({required this.birds});

	@override
	List<Object> get props => [birds];
}

// Bird Cubit
class BirdCubit extends Cubit<BirdState> {
	BirdCubit() : super(BirdInitial());

	final List<Bird> _birds = [];

	void loadBirds() {
		emit(BirdLoading());
		emit(BirdLoaded(birds: _birds));
	}

	void addBird(Bird bird) {
		_birds.add(bird);
	}
}
