
import 'package:google_play_shop/data/models/product.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Product> products;

  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState(this.message);
}