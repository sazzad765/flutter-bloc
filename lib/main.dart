import 'package:bloc_example/injection_service.dart' as di;
import 'package:bloc_example/view/products/bloc/product_bloc.dart';
import 'package:bloc_example/view/products/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(GetProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Product',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const ProductScreen(),
      ),
    );
  }
}
