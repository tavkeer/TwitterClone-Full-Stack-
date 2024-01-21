part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

class HomeClickedState extends MainState {}

class SearchClickedState extends MainState {}

class CommunitiesClickedState extends MainState {}

class NotificationClickedState extends MainState {}

class MessagesClickedState extends MainState {}
