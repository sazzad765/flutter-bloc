import 'package:bloc_example/view/products/bloc/product_bloc.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/view/products/product_item.dart';
import 'package:bloc_example/view/products/update_item.dart';
import 'package:bloc_example/view/theme/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/utils/status.dart';

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
        appBar: AppBar(title: const Text('Products'), actions: const [
          ThemeButton(),
        ]),
        body: BlocBuilder<ProductBloc, ProductState>(
          buildWhen: (previous, current) =>
              current.status.isSuccess ||
              current.status.isUpdate ||
              current.status.isError,
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }
            if (state.status == Status.initial) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }

            if (state.status == Status.error) {
              return const Center(
                child: Text("No data found!"),
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
