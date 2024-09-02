
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_shop/data/services/product_service.dart';
import 'package:google_play_shop/ui/cubits/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoadingState());

  void fetchCategories() async {
    emit(ProductLoadingState());
    try {
      final products =
          ProductService.instance.getAllProducts();
      emit(ProductLoadedState(products));
    } catch (e) {
      emit(ProductErrorState('Failed to fetch products: $e'));
    }
  }

}
