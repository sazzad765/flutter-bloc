import 'package:bloc_example/products/bloc/product_bloc.dart';
import 'package:bloc_example/products/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
              // gameRepository: context.read<GameRepository>(),
              )
            ..add(GetProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Product',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: ProductScreen(),
      ),
    );
  }
}
