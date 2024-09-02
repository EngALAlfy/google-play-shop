import 'package:google_play_shop/data/config/config.dart';
import 'package:google_play_shop/data/models/order.dart';
import 'package:google_play_shop/data/models/product.dart';
import 'package:google_play_shop/data/services/database_service.dart';

class ProductService extends DatabaseService{
  static ProductService? _instance;

  static ProductService get instance => _instance ??= ProductService._(Config.databaseName);

  ProductService._(super.databaseName);

  /// Inserts a new order into the database.
  Future<void> createOrder(Order order) async {
      await insertData('orders', order.toJson());
  }

  /// Retrieves all categories from the database.
  ///
  /// Returns a list of Category objects.
  List<Product> getAllProducts() {
    return [
      Product(),
      Product(),
      Product(),
    ];
  }
}
