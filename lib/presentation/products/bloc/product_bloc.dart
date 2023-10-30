import 'package:bloc_example/di/injection_service.dart';
import 'package:bloc_example/presentation/products/use_case/get_products_use_case.dart';
import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product/product.dart';
import 'package:bloc_example/utils/base_state.dart';
import 'package:bloc_example/utils/status.dart';
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

  final _getProductsUseCase = di.get<GetProductsUseCase>();

  void _mapGetProductsEventToState(
      GetProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: Status.loading));

    final result = await _getProductsUseCase();

    print(result.toJson());
    emit(
      state.copyWith(
        status: result.type,
        message: result.message,
        products: result.data,
      ),
    );
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

    final index =
        state.products.indexWhere((element) => element.id == event.id);
    final product = state.products[index];
    state.products[index] = product.copyWith(title: event.name);
    emit(
      state.copyWith(
          updateStatus: Status.success,
          status: Status.updated,
          products: state.products),
    );
  }
}
