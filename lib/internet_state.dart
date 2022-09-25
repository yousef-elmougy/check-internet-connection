part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetConnect extends InternetState {
  final String text;

  InternetConnect(this.text);
}

class InternetNotConnect extends InternetState {
  final String text;

  InternetNotConnect(this.text);
}
