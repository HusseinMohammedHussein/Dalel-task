import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.heroImageUrl,
  });

  final String id;
  final String name;
  final String icon; // Material icon name (string) to keep it data-only.
  final String heroImageUrl;

  @override
  List<Object?> get props => [id, name, icon, heroImageUrl];
}

