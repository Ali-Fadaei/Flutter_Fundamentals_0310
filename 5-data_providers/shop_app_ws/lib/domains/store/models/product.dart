import 'category.dart';

class Product {
  //
  final int id;

  final String image;

  final String title;

  final double rating;

  final String description;

  final int price;

  final CategoryData categoryData;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.rating,
    required this.description,
    required this.price,
    required this.categoryData,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'rating': rating,
      'description': description,
      'price': price,
      'categoryData': categoryData.toMap(),
    };
  }

  

  Product fromMap(Map map) {
    return Product(
      id: map['id'],
      image: map['image'],
      title: map['title'],
      rating: map['rating'],
      description: map['description'],
      price: map['price'],
      categoryData: CategoryData.fromMap(
        map['categoryData'],
      ),
    );
  }
}
