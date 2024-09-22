
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/bird_cubit.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (context) => BirdCubit(),
			child: MaterialApp(
				title: 'Bird App',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: HomeScreen(),
			),
		);
	}
}
