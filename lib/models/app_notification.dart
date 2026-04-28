import 'package:equatable/equatable.dart';

class AppNotification extends Equatable {
  const AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.timeText,
    required this.isUnread,
  });

  final String id;
  final String title;
  final String body;
  final String timeText;
  final bool isUnread;

  @override
  List<Object?> get props => [id, title, body, timeText, isUnread];
}

