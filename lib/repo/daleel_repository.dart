import '../models/business.dart';
import '../models/category.dart';
import 'dummy_data.dart';

class DaleelRepository {
  const DaleelRepository();

  List<Category> getCategories() => DummyData.categories;

  List<Business> getFeaturedBusinesses() =>
      DummyData.businesses.where((b) => b.isFeatured).toList(growable: false);

  List<Business> getBusinessesByCategory(String categoryId) => DummyData.businesses
      .where((b) => b.categoryId == categoryId)
      .toList(growable: false);

  Business getBusinessById(String id) =>
      DummyData.businesses.firstWhere((b) => b.id == id);

  List<Business> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return const [];

    return DummyData.businesses
        .where(
          (b) =>
              b.name.toLowerCase().contains(q) ||
              b.description.toLowerCase().contains(q) ||
              b.tags.any((t) => t.toLowerCase().contains(q)),
        )
        .toList(growable: false);
  }
}

