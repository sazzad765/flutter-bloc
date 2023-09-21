import 'package:bloc_example/service/injection_service.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/utils/status.dart';
import 'package:bloc_example/view/products/repo/product_repository.dart';
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

  final _repo = di.get<ProductRepository>();

  void _mapGetProductsEventToState(
      GetProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final products = await _repo.getProducts();
      emit(
        state.copyWith(
          status: Status.success,
          products: products,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: Status.error));
    }
  }

  void _mapSelectProductEventToState(
      SelectProduct event, Emitter<ProductState> emit) async {
    emit(
      state.copyWith(
        status: Status.selected,
        idSelected: event.idSelected,
      ),
    );
  }

  void _mapUpdateProductEventToState(
      UpdateProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(updateStatus: Status.loading));

    await Future.delayed(const Duration(seconds: 3));
    final product =
        state.products.firstWhere((element) => element.id == event.id);
    product.title = event.name;
    emit(
      state.copyWith(
          updateStatus: Status.success,
          status: Status.updated,
          products: state.products),
    );
  }
}
