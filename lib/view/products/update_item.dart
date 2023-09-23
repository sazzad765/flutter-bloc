import 'package:bloc_example/view/products/bloc/product_bloc.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateItem extends StatefulWidget {
  const UpdateItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    _textFieldController.text = widget.product.title ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.updateStatus == Status.success) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text('TextField in Dialog'),
          content: TextField(
            onChanged: (value) {},
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Text Field in Dialog"),
          ),
          actions: <Widget>[
            state.updateStatus == Status.loading
                ? const Center(child: CircularProgressIndicator())
                : MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    child: const Text('OK'),
                    onPressed: () {
                      context.read<ProductBloc>().add(
                            UpdateProduct(
                              id: widget.product.id ?? 0,
                              name: _textFieldController.text,
                            ),
                          );

                      // Navigator.pop(context);
                    },
                  ),
          ],
        );
      },
    );
  }
}
