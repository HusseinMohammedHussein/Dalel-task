import 'package:equatable/equatable.dart';

class Business extends Equatable {
  const Business({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.locationText,
    required this.rating,
    required this.ratingCount,
    required this.phone,
    required this.description,
    required this.tags,
    required this.imageUrls,
    required this.isFeatured,
  });

  final String id;
  final String name;
  final String categoryId;
  final String locationText;
  final double rating;
  final int ratingCount;
  final String phone;
  final String description;
  final List<String> tags;
  final List<String> imageUrls;
  final bool isFeatured;

  @override
  List<Object?> get props => [
        id,
        name,
        categoryId,
        locationText,
        rating,
        ratingCount,
        phone,
        description,
        tags,
        imageUrls,
        isFeatured,
      ];
}

