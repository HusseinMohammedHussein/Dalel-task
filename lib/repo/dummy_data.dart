import '../constants/app_assets.dart';
import '../models/app_notification.dart';
import '../models/app_user.dart';
import '../models/business.dart';
import '../models/category.dart';

class DummyData {
  const DummyData._();

  static const user = AppUser(
    id: 'u1',
    fullName: 'Hussein Mohammed',
    email: 'hussein@gmail.com',
    phone: '+201147646690',
    avatarUrl:
        'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?w=600&auto=format&fit=crop&q=60',
    city: 'Egypt',
  );

  static const categories = <Category>[
    Category(
      id: 'c_food',
      name: 'Food',
      icon: 'restaurant',
      heroImageUrl: AppAssets.placeholderFood,
    ),
    Category(
      id: 'c_cafe',
      name: 'Cafés',
      icon: 'coffee',
      heroImageUrl: AppAssets.placeholderCafe,
    ),
    Category(
      id: 'c_shopping',
      name: 'Shopping',
      icon: 'shopping_bag',
      heroImageUrl: AppAssets.placeholderShop,
    ),
    Category(
      id: 'c_services',
      name: 'Services',
      icon: 'handyman',
      heroImageUrl: AppAssets.placeholderBusiness,
    ),
  ];

  static const businesses = <Business>[
    Business(
      id: 'b1',
      name: 'Green Leaf Restaurant',
      categoryId: 'c_food',
      locationText: 'Olaya • 2.1 km',
      rating: 4.6,
      ratingCount: 1240,
      phone: '+966 55 123 4567',
      description:
          'Modern healthy dining with seasonal menus, quick service, and a calm atmosphere. Perfect for lunch meetings and family dinners.',
      tags: ['Healthy', 'Family', 'Dine-in'],
      imageUrls: [
        AppAssets.placeholderFood,
        AppAssets.placeholderBusiness,
      ],
      isFeatured: true,
    ),
    Business(
      id: 'b2',
      name: 'Brew & Co.',
      categoryId: 'c_cafe',
      locationText: 'Al Nakheel • 4.8 km',
      rating: 4.4,
      ratingCount: 860,
      phone: '+966 54 222 0000',
      description:
          'Specialty coffee, fresh pastries, and cozy seating. Great Wi‑Fi for remote work with plenty of power outlets.',
      tags: ['Coffee', 'Work-friendly', 'Desserts'],
      imageUrls: [
        AppAssets.placeholderCafe,
        AppAssets.placeholderBusiness,
      ],
      isFeatured: true,
    ),
    Business(
      id: 'b3',
      name: 'City Mart',
      categoryId: 'c_shopping',
      locationText: 'King Fahd Rd • 1.4 km',
      rating: 4.2,
      ratingCount: 342,
      phone: '+966 53 777 1111',
      description:
          'A curated mini-market with daily essentials and premium snacks. Fast checkout and friendly staff.',
      tags: ['Groceries', 'Snacks', 'Essentials'],
      imageUrls: [
        AppAssets.placeholderShop,
        AppAssets.placeholderBusiness,
      ],
      isFeatured: false,
    ),
    Business(
      id: 'b4',
      name: 'FixIt Pro',
      categoryId: 'c_services',
      locationText: 'Al Malqa • 5.9 km',
      rating: 4.8,
      ratingCount: 210,
      phone: '+966 56 999 0000',
      description:
          'Home maintenance services: plumbing, electrical, and AC. Transparent pricing with same-day availability.',
      tags: ['Maintenance', 'Same-day', 'Trusted'],
      imageUrls: [
        AppAssets.placeholderBusiness,
        AppAssets.placeholderShop,
      ],
      isFeatured: false,
    ),
  ];

  static const notifications = <AppNotification>[
    AppNotification(
      id: 'n1',
      title: 'New businesses added',
      body: '3 new places in Food near you. Check them out.',
      timeText: '2h ago',
      isUnread: true,
    ),
    AppNotification(
      id: 'n2',
      title: 'Favorites reminder',
      body: 'You have 2 saved places with updated working hours.',
      timeText: 'Yesterday',
      isUnread: false,
    ),
  ];
}

