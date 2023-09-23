import 'package:bloc_example/service/injection_service.dart' as di;
import 'package:bloc_example/utils/route/route.dart';
import 'package:bloc_example/utils/theme/custom_themes.dart';
import 'package:bloc_example/view/products/bloc/product_bloc.dart';
import 'package:bloc_example/view/products/product/product_screen.dart';
import 'package:bloc_example/view/theme/theme_bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  di.setup();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit()..getCurrentTheme(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(GetProducts()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Product',
          theme: AppThemes.appThemeData[state],
          onGenerateRoute: onGenerateRoute,
          home: const ProductScreen(),
        ),
      ),
    );
  }
}
