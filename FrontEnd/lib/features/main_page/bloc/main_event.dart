part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class HomeClickedEvent extends MainEvent {}

class CommunitiesClickedEvent extends MainEvent {}

class SearchClickedEvent extends MainEvent {}

class NotificationClickedEvent extends MainEvent {}

class MessagesClickedEvent extends MainEvent {}
