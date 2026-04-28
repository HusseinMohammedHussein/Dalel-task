import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesState extends Equatable {
  const FavoritesState({
    required this.businessIds,
  });

  final Set<String> businessIds;

  bool isFavorite(String id) => businessIds.contains(id);

  @override
  List<Object?> get props => [businessIds.length, businessIds.join(',')];
}

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState(businessIds: {}));

  void toggle(String businessId) {
    final next = Set<String>.of(state.businessIds);
    if (!next.add(businessId)) {
      next.remove(businessId);
    }
    emit(FavoritesState(businessIds: next));
  }

  void remove(String businessId) {
    final next = Set<String>.of(state.businessIds)..remove(businessId);
    emit(FavoritesState(businessIds: next));
  }
}

