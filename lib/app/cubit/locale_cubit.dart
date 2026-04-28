import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleState extends Equatable {
  const LocaleState({
    required this.locale,
  });

  final Locale? locale; // null = system

  @override
  List<Object?> get props => [locale?.languageCode];
}

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(locale: null));

  void setLocale(Locale? locale) => emit(LocaleState(locale: locale));

  void setLanguageCode(String code) {
    if (code == 'system') return setLocale(null);
    emit(LocaleState(locale: Locale(code)));
  }
}

