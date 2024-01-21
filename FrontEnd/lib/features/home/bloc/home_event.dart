part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class InitialEvent extends HomeEvent {}
