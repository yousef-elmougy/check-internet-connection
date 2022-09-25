import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';


class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial());

  void checkInternet() => InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
          switch (status) {
            case InternetConnectionStatus.connected:
              emit(InternetConnect('Data connection is available.'));
              break;
            case InternetConnectionStatus.disconnected:
              emit(InternetNotConnect(
                  'You are disconnected from the internet.'));
              break;
          }
        },
      );
}
