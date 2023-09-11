import 'package:bloc_example/view/products/bloc/product_bloc.dart';
import 'package:bloc_example/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ProductCLicked = Function(Product productSelected);

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    required this.callback,
    required this.longPress,
  }) : super(key: key);

  final Product product;
  final ProductCLicked callback;
  final ProductCLicked longPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(product),
      onLongPress: () => longPress(product),
      child: BlocSelector<ProductBloc, ProductState, bool>(
        selector: (state) =>
            (state.status.isSelected && state.idSelected == product.id)
                ? true
                : false,
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutCirc,
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  alignment: Alignment.center,
                  height: state ? 70.0 : 60.0,
                  width: state ? 70.0 : 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state ? Colors.deepOrangeAccent : Colors.amberAccent,
                  ),
                  child: Icon(
                    Icons.gamepad_outlined,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  product.title ?? '',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.description ?? '',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
