import 'package:bloc_example/utils/theme/custom_themes.dart';
import 'package:bloc_example/view/common/custom_card.dart';
import 'package:bloc_example/view/common/custom_image.dart';
import 'package:bloc_example/view/products/bloc/product_bloc.dart';
import 'package:bloc_example/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/utils/status.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {Key? key,
      required this.product,
      required this.callback,
      required this.longPress,
      required this.onDoubleTap})
      : super(key: key);

  final Product product;
  final void Function()? callback;
  final void Function()? longPress;
  final void Function()? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      onLongPress: longPress,
      onDoubleTap: onDoubleTap,
      child: BlocSelector<ProductBloc, ProductState, bool>(
        selector: (state) =>
            (state.status.isSelected && state.idSelected == product.id)
                ? true
                : false,
        builder: (context, state) {
          return CustomCard(
            borderWidth: state ? 1 : null,
            margin: const EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomImage(imageUrl: product.thumbnail ?? ''),
                CustomSpacing.verticalSpace(space: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    product.title ?? '',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CustomSpacing.verticalSpace(space: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    product.description ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomSpacing.verticalSpace(),
              ],
            ),
          );
        },
      ),
    );
  }
}
