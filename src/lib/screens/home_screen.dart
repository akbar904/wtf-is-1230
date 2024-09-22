
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bird_app/cubits/bird_cubit.dart';
import 'package:bird_app/widgets/bird_list_widget.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Bird List'),
			),
			body: BlocBuilder<BirdCubit, BirdState>(
				builder: (context, state) {
					if (state is BirdLoadingState) {
						return const Center(
							child: CircularProgressIndicator(),
						);
					} else if (state is BirdLoadedState) {
						return BirdListWidget(birds: state.birds);
					} else if (state is BirdErrorState) {
						return Center(
							child: Text(state.message),
						);
					} else {
						return const SizedBox.shrink();
					}
				},
			),
		);
	}
}
