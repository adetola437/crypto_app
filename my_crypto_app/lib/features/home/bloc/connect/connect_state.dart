part of 'connect_bloc.dart';

sealed class ConnectState extends Equatable {
  const ConnectState();

  @override
  List<Object> get props => [];
}

final class ConnectInitial extends ConnectState {}

final class Connecting extends ConnectState {}

final class Connected extends ConnectState {
  String price;

  Connected({required this.price});
  @override
  List<Object> get props => [price];
}
final class ConnectError extends ConnectState {
  String message;

  ConnectError({required this.message});
  @override
  List<Object> get props => [message];
}
