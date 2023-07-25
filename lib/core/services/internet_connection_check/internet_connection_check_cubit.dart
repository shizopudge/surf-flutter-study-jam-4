import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'internet_connection_check_cubit.freezed.dart';
part 'internet_connection_check_state.dart';

class InternetConnectionCheckCubit extends Cubit<InternetConnectionCheckState> {
  final InternetConnection _internetConnection;
  late final StreamSubscription? connectivityStreamSubscription;
  InternetConnectionCheckCubit({required InternetConnection internetConnection})
      : _internetConnection = internetConnection,
        super(const _LoadingState()) {
    _monitorInternetConnection();
  }

  void _monitorInternetConnection() {
    connectivityStreamSubscription =
        _internetConnection.onStatusChange.listen((connectivityResult) async {
      if (connectivityResult == InternetStatus.connected) {
        emit(const InternetConnectionCheckState.connected());
      } else {
        emit(const InternetConnectionCheckState.disconnected());
      }
    });
  }

  void checkInternetConnection() async {
    final bool connectivityResult = await _internetConnection.hasInternetAccess;
    if (connectivityResult) {
      emit(const InternetConnectionCheckState.connected());
    } else {
      emit(const InternetConnectionCheckState.disconnected());
    }
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
