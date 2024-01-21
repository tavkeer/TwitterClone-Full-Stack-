part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingSuccessState extends HomeState {}

class HomeLoadingErrorState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitialSuccessState extends HomeState {
  final List<Post> posts;

  HomeInitialSuccessState({required this.posts});
}
