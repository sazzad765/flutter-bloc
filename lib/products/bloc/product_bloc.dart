import 'package:bloc_example/products/bloc/data.dart';
import 'package:bloc_example/products/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<GetProducts>(_mapGetProductsEventToState);
    on<SelectProduct>(_mapSelectProductEventToState);
    on<UpdateProduct>(_mapUpdateProductEventToState);
  }

  // final GameRepository gameRepository;

  void _mapGetProductsEventToState(
      GetProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      final products =
          List<Product>.from(productsData.map((x) => Product.fromJson(x)));
      emit(
        state.copyWith(
          status: ProductStatus.success,
          products: products,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: ProductStatus.error));
    }
  }

  void _mapSelectProductEventToState(
      SelectProduct event, Emitter<ProductState> emit) async {
    emit(
      state.copyWith(
        status: ProductStatus.selected,
        idSelected: event.idSelected,
      ),
    );
  }

  void _mapUpdateProductEventToState(
      UpdateProduct event, Emitter<ProductState> emit) async {
    final product =
        state.products.firstWhere((element) => element.id == event.id);
    product.title = event.name;
    emit(
      state.copyWith(
        status: ProductStatus.update,
        products: state.products,
      ),
    );
  }
}
