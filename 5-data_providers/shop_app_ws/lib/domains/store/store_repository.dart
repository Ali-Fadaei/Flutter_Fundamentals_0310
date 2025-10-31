import 'dart:ui';
import 'package:shop_app_ws/data_providers/businees_ws/business_ws.dart';

import '/domains/store/store_box.dart';

import '/domains/store/models/category.dart';
import '/domains/store/models/product.dart';
import '/domains/store/models/shop_item.dart';

class StoreRepository {
  //
  final _delay = 1000;

  final accessToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiY2xpZW50LWp3dCIsImlkIjoxLCJyb2xlIjoxLCJpYXQiOjE3NjEyOTY1OTYsImV4cCI6MTc2Mzg4ODU5Nn0.xSJS9bZlX88ossBMUwl8CUQxNQckfWHx7fNa-Kog61o';

  static Future<StoreRepository> init() async {
    await StoreBox.open();
    return StoreRepository();
  }

  // List<Product> _favorites = [];

  List<ShopItem> _shopItems = [];

  Future<List<CategoryData>> readCategories() async {
    final res = await BusinessWS.client.get(
      BusinessWS.urls.productCategory,
    );
    return List<CategoryData>.from(
      res.data.map((e) => CategoryData.fromMap(e)),
    );
  }

  Future<CategoryData> readCategory({required int id}) async {
    //Read
    final res = await BusinessWS.client.get(
      BusinessWS.urls.productCategory,
      param: id.toString(),
    );
    return CategoryData.fromMap(res.data);
  }

  Future<List<Product>> readProducts({
    String? title,
    List<int> categoryIds = const [],
    double? minRate,
    double? maxRate,
    int? minPrice,
    int? maxPrice,
    int? sort = 1,
    int? order = 1,
  }) async {
    final res = await BusinessWS.client.get(
      BusinessWS.urls.product,
      queryParams: {
        'title': title,
        'categoryIds': categoryIds,
        'minRate': minRate,
        'maxRate': maxRate,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'sort': sort,
        'order': order,
        'isActive': true,
      },
    );
    return List.from(res.data.map((e) => Product.fromMap(e)));
  }

  Future<Product> readProduct({required int id}) async {
    final res = await readProducts();
    return res.firstWhere((e) => e.id == id);
  }

  //===============================================

  Future<List<Product>> readFavorites() async {
    final res = await BusinessWS.client.get(
      BusinessWS.urls.favorite,
      accessToken: accessToken,
    );
    return List.from(res.data.map((e) => Product.fromMap(e)));
  }

  // Future<void> updateFavorites(List<Product> favs) async {
  //   //  await BusinessWS.client.
  // }

  Future<void> addFavorite(Product product) async {
    await BusinessWS.client.post(
      BusinessWS.urls.favorite,
      accessToken: accessToken,
      data: {
        "productId": product.id,
      },
    );
  }

  Future<void> removeFavorite(Product product) async {
    await BusinessWS.client.delete(
      BusinessWS.urls.favorite,
      accessToken: accessToken,
      ids: [
        product.id,
      ],
    );
  }

  Future<List<ShopItem>> readShopItems() async {
    //Read
    await Future.delayed(Duration(milliseconds: _delay));
    return _shopItems;
  }

  Future<void> updateShopItems(List<ShopItem> shopItems) async {
    //Update
    await Future.delayed(Duration(milliseconds: _delay));
    _shopItems = shopItems;
  }

  Future<int> validateDiscountCode(String discountCode) async {
    await Future.delayed(Duration(milliseconds: _delay));
    return 15;
  }

  Future<bool> createOrder(String deliveryAddress) async {
    //Create
    await Future.delayed(Duration(milliseconds: _delay));
    return true;
  }
}
