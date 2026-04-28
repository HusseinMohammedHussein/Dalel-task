import 'package:flutter/material.dart';

import '../screens/auth/admin_login_screen.dart';
import '../screens/auth/auth_selection_screen.dart';
import '../screens/auth/otp_request_screen.dart';
import '../screens/auth/otp_verification_screen.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/main/business_details_screen.dart';
import '../screens/main/businesses_list_screen.dart';
import '../screens/main/categories_list_screen.dart';
import '../screens/main/favorites_screen.dart';
import '../screens/main/home_screen.dart';
import '../screens/main/map_view_screen.dart';
import '../screens/main/notifications_screen.dart';
import '../screens/main/profile_screen.dart';
import '../screens/main/search_results_screen.dart';
import '../screens/main/search_screen.dart';
import '../screens/settings/edit_profile_screen.dart';
import '../screens/settings/language_screen.dart';
import '../screens/settings/notification_settings_screen.dart';
import '../screens/settings/privacy_screen.dart';
import '../screens/settings/settings_screen.dart';

class AppRoutes {
  const AppRoutes._();

  // Auth (5)
  static const splash = '/';
  static const authSelection = '/auth';
  static const otpRequest = '/auth/otp-request';
  static const otpVerify = '/auth/otp-verify';
  static const adminLogin = '/auth/admin-login';

  // Main (10)
  static const home = '/home';
  static const categories = '/categories';
  static const businessesByCategory = '/businesses';
  static const businessDetails = '/business';
  static const search = '/search';
  static const searchResults = '/search/results';
  static const favorites = '/favorites';
  static const map = '/map';
  static const notifications = '/notifications';
  static const profile = '/profile';

  // Settings (5)
  static const settings = '/settings';
  static const editProfile = '/settings/edit-profile';
  static const language = '/settings/language';
  static const notificationSettings = '/settings/notifications';
  static const privacy = '/settings/privacy';
}

class BusinessesListArgs {
  const BusinessesListArgs({
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;
}

class OtpRequestArgs {
  const OtpRequestArgs({
    this.viaEmail,
  });

  final bool? viaEmail;
}

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _page(const SplashScreen());
      case AppRoutes.authSelection:
        return _page(const AuthSelectionScreen());
      case AppRoutes.otpRequest:
        final args = settings.arguments is OtpRequestArgs
            ? settings.arguments! as OtpRequestArgs
            : const OtpRequestArgs();
        return _page(OtpRequestScreen(initialViaEmail: args.viaEmail));
      case AppRoutes.otpVerify:
        return _page(const OtpVerificationScreen());
      case AppRoutes.adminLogin:
        return _page(const AdminLoginScreen());

      case AppRoutes.home:
        return _page(const HomeScreen());
      case AppRoutes.categories:
        return _page(const CategoriesListScreen());
      case AppRoutes.businessesByCategory:
        final args = settings.arguments is BusinessesListArgs
            ? settings.arguments! as BusinessesListArgs
            : const BusinessesListArgs(categoryId: 'c_food', categoryName: 'Food');
        return _page(
          BusinessesListScreen(
            categoryId: args.categoryId,
            categoryName: args.categoryName,
          ),
        );
      case AppRoutes.businessDetails:
        final businessId = settings.arguments is String
            ? settings.arguments! as String
            : 'b1';
        return _page(BusinessDetailsScreen(businessId: businessId));
      case AppRoutes.search:
        return _page(const SearchScreen());
      case AppRoutes.searchResults:
        final query = settings.arguments is String ? settings.arguments! as String : '';
        return _page(SearchResultsScreen(query: query));
      case AppRoutes.favorites:
        return _page(const FavoritesScreen());
      case AppRoutes.map:
        return _page(const MapViewScreen());
      case AppRoutes.notifications:
        return _page(const NotificationsScreen());
      case AppRoutes.profile:
        return _page(const ProfileScreen());

      case AppRoutes.settings:
        return _page(const SettingsScreen());
      case AppRoutes.editProfile:
        return _page(const EditProfileScreen());
      case AppRoutes.language:
        return _page(const LanguageScreen());
      case AppRoutes.notificationSettings:
        return _page(const NotificationSettingsScreen());
      case AppRoutes.privacy:
        return _page(const PrivacyScreen());
    }

    return _page(
      Scaffold(
        appBar: AppBar(title: const Text('Not found')),
        body: Center(child: Text('Route not found: ${settings.name}')),
      ),
    );
  }

  static PageRoute<T> _page<T>(Widget child) {
    return MaterialPageRoute<T>(builder: (_) => child);
  }
}

