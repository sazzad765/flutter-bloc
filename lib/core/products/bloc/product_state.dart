part of 'product_bloc.dart';

class ProductState extends Equatable implements BaseState {
  const ProductState({
    this.status = Status.initial,
    this.message = '',
    this.updateStatus = Status.initial,
    List<Product>? products,
    this.idSelected = 0,
    this.search = '',
  }) : products = products ?? const [];

  @override
  final Status status;
  @override
  final String message;
  final List<Product> products;
  final int idSelected;
  final Status updateStatus;
  final String search;


  ProductState copyWith({
    List<Product>? products,
    Status? status,
    String? message,
    Status? updateStatus,
    int? idSelected,
    String? search,
  }) {
    return ProductState(
      products: products ?? this.products,
      status: status ?? this.status,
      message: message ?? this.message,
      updateStatus: updateStatus ?? this.updateStatus,
      idSelected: idSelected ?? this.idSelected,
      search: search ?? this.search,
    );
  }

  @override
  List<Object?> get props =>
      [status, products, idSelected, updateStatus, message, search];
}
