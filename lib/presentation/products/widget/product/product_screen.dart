import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/presentation/common/base_layout.dart';
import 'package:bloc_example/presentation/products/bloc/product_bloc.dart';
import 'package:bloc_example/presentation/products/widget/product/product_item.dart';
import 'package:bloc_example/presentation/products/widget/product/update_item.dart';
import 'package:bloc_example/presentation/theme/theme_button.dart';
import 'package:bloc_example/utils/route/route.dart';
import 'package:bloc_example/utils/status.dart';
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
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) =>
          current.status.isSuccess ||
          current.status.isUpdate ||
          current.status.isError,
      builder: (context, state) {
        return BaseLayout(
            title: 'Products',
            actions: const [
              ThemeButton(),
            ],
            state: state,
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              itemBuilder: (context, index) {
                final item = state.products[index];
                // return const Shimmer(
                //   child: ProductItem(product: Product()),
                // );
                return ProductItem(
                  product: item,
                  // onDoubleTap: () {
                  //   context.read<ProductBloc>().add(
                  //         SelectProduct(
                  //           idSelected: item.id ?? 0,
                  //         ),
                  //       );
                  // },
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.productDetails,
                        arguments: item.id);
                  },
                  onLongPress: () {
                    showUpdateItem(item);
                  },
                );
              },
              itemCount: state.products.length,
            ));
      },
    );
  }
}
