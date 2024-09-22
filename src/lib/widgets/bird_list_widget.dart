
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bird_app/cubits/bird_cubit.dart';
import 'package:bird_app/widgets/bird_item_widget.dart';

// BirdListWidget
class BirdListWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocBuilder<BirdCubit, BirdState>(
			builder: (context, state) {
				if (state is BirdLoadingState) {
					return Center(child: CircularProgressIndicator());
				} else if (state is BirdLoadedState) {
					return ListView.builder(
						itemCount: state.birds.length,
						itemBuilder: (context, index) {
							final bird = state.birds[index];
							return BirdItemWidget(bird: bird);
						},
					);
				} else if (state is BirdErrorState) {
					return Center(child: Text(state.message));
				} else {
					return Center(child: Text('Unknown state'));
				}
			},
		);
	}
}
