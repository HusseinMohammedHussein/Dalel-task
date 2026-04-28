import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../routing/app_router.dart';
import '../../widgets/common/app_search_field.dart';
import '../../widgets/states/empty_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.pagePadding,
          children: [
            AppSearchField(
              controller: _controller,
              autofocus: true,
              hintText: 'Search restaurants, cafés, services...',
              onSubmitted: (q) => Navigator.of(context)
                  .pushNamed(AppRoutes.searchResults, arguments: q),
            ),
            const SizedBox(height: AppSpacing.xl),
            const EmptyState(
              title: 'Search Daleel',
              subtitle: 'Try searching by business name, tags, or description.',
              icon: Icons.search,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
              return;
            case 1:
              return;
            case 2:
              Navigator.of(context).pushReplacementNamed(AppRoutes.favorites);
              return;
            case 3:
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
              return;
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.favorite_outline), label: 'Favorites'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

