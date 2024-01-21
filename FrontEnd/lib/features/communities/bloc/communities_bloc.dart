import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'communities_event.dart';
part 'communities_state.dart';

class CommunitiesBloc extends Bloc<CommunitiesEvent, CommunitiesState> {
  CommunitiesBloc() : super(CommunitiesInitial()) {
    on<CommunitiesEvent>((event, emit) {});
  }
}
