import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<HomeClickedEvent>(homeClickedEvent);
    on<SearchClickedEvent>(searchClickedEvent);
    on<CommunitiesClickedEvent>(communitiesClickedEvent);
    on<NotificationClickedEvent>(notificationClickedEvent);
    on<MessagesClickedEvent>(messagesClickedEvent);
  }

  FutureOr<void> homeClickedEvent(
      HomeClickedEvent event, Emitter<MainState> emit) {
    emit(HomeClickedState());
  }

  FutureOr<void> searchClickedEvent(
      SearchClickedEvent event, Emitter<MainState> emit) {
    emit(SearchClickedState());
  }

  FutureOr<void> communitiesClickedEvent(
      CommunitiesClickedEvent event, Emitter<MainState> emit) {
    emit(CommunitiesClickedState());
  }

  FutureOr<void> notificationClickedEvent(
      NotificationClickedEvent event, Emitter<MainState> emit) {
    emit(NotificationClickedState());
  }

  FutureOr<void> messagesClickedEvent(
      MessagesClickedEvent event, Emitter<MainState> emit) {
    emit(MessagesClickedState());
  }
}
