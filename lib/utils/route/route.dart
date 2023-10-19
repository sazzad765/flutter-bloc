import 'package:bloc_example/presentation/products/widget/product/product_screen.dart';
import 'package:bloc_example/presentation/products/widget/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  static String home = "/home";
  static String productDetails = "/product_details";
}

Map<String, WidgetBuilder> routes({Object? arg}) => {
      RouteName.home: (context) => const ProductScreen(),
      RouteName.productDetails: (context) =>
          ProductDetailsScreen(id: arg != null ? arg as int : 0),
    };

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  final Function? builder =
      routes(arg: routeSettings.arguments)[routeSettings.name];
  if (builder != null) {
    final Route route = MaterialPageRoute(
        settings: routeSettings, builder: (context) => builder(context));
    return route;
  } else {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: Center(
                child: Text('Page not found for ${routeSettings.name}'),
              ),
            ));
  }
}
