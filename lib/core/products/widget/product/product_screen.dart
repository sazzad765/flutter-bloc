import 'package:bloc_example/common/widget/extension/widget_extension.dart';
import 'package:bloc_example/common/utils/search.dart';
import 'package:bloc_example/common/widget/base_layout.dart';
import 'package:bloc_example/common/widget/custom_text_form_filed.dart';
import 'package:bloc_example/models/product/product.dart';
import 'package:bloc_example/core/products/bloc/product_bloc.dart';
import 'package:bloc_example/core/products/widget/product/product_item.dart';
import 'package:bloc_example/core/products/widget/product/update_item.dart';
import 'package:bloc_example/core/theme/theme_button.dart';
import 'package:bloc_example/common/utils/route/route.dart';
import 'package:bloc_example/common/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _controller = TextEditingController();

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
        print('search : ${state.search}');
        return BaseLayout(
            title: 'Products',
            actions: [
              const ThemeButton(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart,
                ),
              ).badge(count: 4),
            ],
            state: state,
            child: Column(
              children: [
                search(),
                Expanded(
                  child: _list(),
                ),
              ],
            ));
      },
    );
  }

  Widget _list() {
    return BlocSelector<ProductBloc, ProductState, List<Product>>(
        selector: (state) => Search.find(
              items: state.products,
              q: state.search,
            ),
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16,
            ),
            itemBuilder: (context, index) {
              final item = state[index];
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
                  Navigator.pushNamed(
                    context,
                    RouteName.productDetails,
                    arguments: item.id,
                  );
                },
                onLongPress: () {
                  showUpdateItem(item);
                },
              );
            },
          );
        });
  }

  Widget search() {
    return CustomTextFormField(
      type: CustomTextFormFieldType.outlined,
      controller: _controller,
      icon: FontAwesomeIcons.magnifyingGlass,
      onChanged: (p0) {
        context.read<ProductBloc>().add(SearchProduct(query: p0));
      },
    ).padding(top: 16, bottom: 8, right: 16, left: 16);
  }
}
