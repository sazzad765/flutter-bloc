part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProducts extends ProductEvent {}

class SelectProduct extends ProductEvent {
  SelectProduct({
    required this.idSelected,
  });

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class UpdateProduct extends ProductEvent {
  UpdateProduct({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

// @override
// List<Object?> get props => [idSelected];
}
