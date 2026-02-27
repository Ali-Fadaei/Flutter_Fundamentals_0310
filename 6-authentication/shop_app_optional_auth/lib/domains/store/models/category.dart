import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryData extends Equatable {
  //
  final int id;

  final String title;

  final String image;

  final Color color;

  const CategoryData({
    required this.id,
    required this.title,
    required this.image,
    required this.color,
  });

  factory CategoryData.fromMap(Map map) {
    return CategoryData(
      id: map['id'],
      title: map['title'],
      image: map['Image'],
      color: Color(int.parse(map['color'])),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'Image': image,
      'color': color.toARGB32().toString(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        color,
      ];
}
