import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/utils/theme/custom_themes.dart';
import 'package:bloc_example/presentation/common/custom_app_bar.dart';
import 'package:bloc_example/presentation/common/custom_image.dart';
import 'package:bloc_example/presentation/products/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProductBloc, ProductState, Product>(
      selector: (state) {
        return state.products.firstWhere(
          (element) => element.id == id,
          orElse: () => const Product(),
        );
      },
      builder: (context, product) {
        return Scaffold(
          appBar: CustomAppBar(title: product.title ?? ''),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomImage(imageUrl: product.thumbnail ?? ''),
                CustomSpacing.verticalSpace(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Model: ${product.title ?? ''} ',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CustomSpacing.verticalSpace(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Price: \$${product.price ?? ''} ',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CustomSpacing.verticalSpace(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Brand: ${product.brand ?? ''} ',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CustomSpacing.verticalSpace(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Rating: ${product.rating ?? ''} ',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CustomSpacing.verticalSpace(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Stock: ${product.stock ?? ''} ',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CustomSpacing.verticalSpace(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    product.description ?? '',
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomSpacing.verticalSpace(),
              ],
            ),
          ),
        );
      },
    );
  }
}
