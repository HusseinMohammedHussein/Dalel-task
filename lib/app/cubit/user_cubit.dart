import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/app_user.dart';
import '../../repo/dummy_data.dart';

class UserCubit extends Cubit<AppUser> {
  UserCubit() : super(DummyData.user);

  void update({
    required String fullName,
    required String email,
    required String phone,
    required String city,
  }) {
    emit(
      AppUser(
        id: state.id,
        fullName: fullName,
        email: email,
        phone: phone,
        avatarUrl: state.avatarUrl,
        city: city,
      ),
    );
  }
}

