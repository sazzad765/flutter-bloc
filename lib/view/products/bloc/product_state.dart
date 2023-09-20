part of 'product_bloc.dart';

// enum Status { initial, success, error, loading, selected, update }
//
// extension StatusX on Status {
//   bool get isInitial => this == Status.initial;
//
//   bool get isSuccess => this == Status.success;
//
//   bool get isError => this == Status.error;
//
//   bool get isLoading => this == Status.loading;
//
//   bool get isSelected => this == Status.selected;
//
//   bool get isUpdate => this == Status.update;
// }

class ProductState extends Equatable {
  const ProductState({
    this.status = Status.initial,
    this.updateStatus = Status.initial,
    List<Product>? products,
    this.idSelected = 0,
  }) : products = products ?? const [];

  final List<Product> products; //product list
  final Status status; //status
  final int idSelected; //selected item id
  final Status updateStatus; //item update status

  ProductState copyWith({
    List<Product>? products,
    Status? status,
    Status? updateStatus,
    int? idSelected,
  }) {
    return ProductState(
      products: products ?? this.products,
      status: status ?? this.status,
      updateStatus: updateStatus ?? this.updateStatus,
      idSelected: idSelected ?? this.idSelected,
    );
  }

  @override
  List<Object?> get props => [status, products, idSelected, updateStatus];
}
