import 'package:bloc_example/common/widget/custom_button.dart';
import 'package:bloc_example/common/widget/custom_dialog.dart';
import 'package:bloc_example/common/widget/custom_text_form_filed.dart';
import 'package:bloc_example/common/widget/custom_toast.dart';
import 'package:bloc_example/utils/extension/widget_extension.dart';
import 'package:bloc_example/utils/validator/form_validator.dart';
import 'package:bloc_example/utils/theme/custom_themes.dart';
import 'package:bloc_example/presentation/products/bloc/product_bloc.dart';
import 'package:bloc_example/models/product/product.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _textFieldController.text = widget.product.title ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Update Name',
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                onChanged: (value) {},
                controller: _textFieldController,
                validator: Validator.name,
                type: CustomTextFormFieldType.outlined,
                labelText: 'Name',
              ),
              CustomSpacing.verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Cancel',
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CustomSpacing.horizontalSpace(),
                  Expanded(child: updateButton()),
                ],
              ).height(40)
            ],
          ),
        ),
      ),
    );
  }

  Widget updateButton() {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.updateStatus == Status.success) {
          CustomToast(context: context).success(msg: 'Update successfully.');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Update',
          color: Colors.green,
          showProgressIndicator: state.updateStatus == Status.loading,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<ProductBloc>().add(
                UpdateProduct(
                  id: widget.product.id ?? 0,
                  name: _textFieldController.text,
                ),
              );
            }
          },
        );
      },
    );
  }
}
