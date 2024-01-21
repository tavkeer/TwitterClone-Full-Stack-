import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/models/post.dart';
import 'package:twitterclone/features/home/data/api_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadingEvent>(loadingState);
    on<InitialEvent>(initialApiCallState);
  }

  FutureOr<void> loadingState(
      HomeLoadingEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> initialApiCallState(
      InitialEvent event, Emitter<HomeState> emit) async {
    debugPrint("Hello World!");
    emit(HomeLoadingState());
    List<Post>? posts = await ApiService.getAllPosts();
    if (posts == null) {
      emit(HomeLoadingErrorState());
    } else if (posts.isNotEmpty) {
      emit(HomeInitialSuccessState(posts: posts));
    }
  }
}
