part of 'product_bloc.dart';

enum ProductStatus { initial, success, error, loading, selected, update }

extension ProductStatusX on ProductStatus {
  bool get isInitial => this == ProductStatus.initial;

  bool get isSuccess => this == ProductStatus.success;

  bool get isError => this == ProductStatus.error;

  bool get isLoading => this == ProductStatus.loading;

  bool get isSelected => this == ProductStatus.selected;

  bool get isUpdate => this == ProductStatus.update;
}

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    List<Product>? products,
    this.idSelected = 0,
  }) : products = products ?? const [];

  final List<Product> products;
  final ProductStatus status;
  final int idSelected;

  @override
  List<Object?> get props => [status, products, idSelected];

  ProductState copyWith({
    List<Product>? products,
    ProductStatus? status,
    int? idSelected,
  }) {
    return ProductState(
      products: products ?? this.products,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
