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
      image: map['image'],
      color: Color(map['color']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'color': color.toARGB32(),
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
