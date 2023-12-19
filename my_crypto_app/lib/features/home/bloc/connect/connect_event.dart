part of 'connect_bloc.dart';

abstract class ConnectEvent extends Equatable {
  const ConnectEvent();

  @override
  List<Object> get props => [];
}

class ConnectToServer extends ConnectEvent {
  String url;

  ConnectToServer({required this.url});
}
class PriceUpdate extends ConnectEvent {
  String price;

  PriceUpdate({required this.price});
}
class Disconnect extends ConnectEvent {

}
class ConnectFail extends ConnectEvent {

}