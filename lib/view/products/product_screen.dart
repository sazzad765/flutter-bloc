import 'package:bloc_example/service/theme_bloc/theme_cubit.dart';
import 'package:bloc_example/utils/custom_themes.dart';
import 'package:bloc_example/view/products/bloc/product_bloc.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/view/products/product_item.dart';
import 'package:bloc_example/view/products/update_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  void showUpdateItem(Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateItem(product: product);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Products'), actions: [
          BlocBuilder<ThemeCubit, AppTheme>(
            builder: (context, state) {
              return Switch(
                value: state == AppTheme.lightMode,
                onChanged: (value) {
                  context.read<ThemeCubit>().changeTheme(
                      value ? AppTheme.lightMode : AppTheme.darkMode);
                },
              );
            },
          )
        ]),
        body: BlocBuilder<ProductBloc, ProductState>(
          buildWhen: (previous, current) =>
              current.status.isSuccess || current.status.isUpdate,
          builder: (context, state) {
            if (state.status == ProductStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }
            if (state.status == ProductStatus.initial) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                return ProductItem(
                  product: state.products[index],
                  callback: (Product productSelected) {
                    context.read<ProductBloc>().add(
                          SelectProduct(
                            idSelected: productSelected.id ?? 0,
                          ),
                        );
                  },
                  longPress: (productSelected) {
                    showUpdateItem(productSelected);
                  },
                );
              },
              itemCount: state.products.length,
            );
          },
        ));
  }
}
