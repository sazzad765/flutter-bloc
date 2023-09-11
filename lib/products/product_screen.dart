import 'package:bloc_example/products/bloc/product_bloc.dart';
import 'package:bloc_example/products/product.dart';
import 'package:bloc_example/products/product_item.dart';
import 'package:bloc_example/products/update_item.dart';
import 'package:flutter/cupertino.dart';
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
        appBar: AppBar(title: const Text('Products')),
        body: BlocBuilder<ProductBloc, ProductState>(
          buildWhen: (previous, current) => current.status.isSuccess || current.status.isUpdate,
          builder: (context, state) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                return ProductItem(
                  // key: ValueKey('${state.products[index].title}$index'),
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
