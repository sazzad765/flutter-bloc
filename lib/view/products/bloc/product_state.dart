part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.status = Status.initial,
    this.message = '',
    this.updateStatus = Status.initial,
    List<Product>? products,
    this.idSelected = 0,
  }) : products = products ?? const [];

  final List<Product> products; //product list
  final Status status; //status
  final String message; //message
  final int idSelected; //selected item id
  final Status updateStatus; //item update status

  ProductState copyWith({
    List<Product>? products,
    Status? status,
    String? message,
    Status? updateStatus,
    int? idSelected,
  }) {
    return ProductState(
      products: products ?? this.products,
      status: status ?? this.status,
      message: message ?? this.message,
      updateStatus: updateStatus ?? this.updateStatus,
      idSelected: idSelected ?? this.idSelected,
    );
  }

  @override
  List<Object?> get props =>
      [status, products, idSelected, updateStatus, message];
}
