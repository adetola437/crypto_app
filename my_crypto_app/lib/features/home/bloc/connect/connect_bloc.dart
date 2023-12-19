import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_socket_channel/io.dart';

part 'connect_event.dart';
part 'connect_state.dart';

class ConnectBloc extends Bloc<ConnectEvent, ConnectState> {
  late String url;
  // final _streamController = StreamController<Function>();
  // Stream<ConnectState> get stream => _streamController.stream;
  String price = '0';
  IOWebSocketChannel? channel;
  ConnectBloc({required this.url}) : super(ConnectInitial()) {
    on<ConnectToServer>((event, emit) async {
      await _connectToServer(event, emit);
    });
    on<PriceUpdate>((event, emit) async {
      await _priceChange(event, emit);
    });
    on<Disconnect>((event, emit) async {
      await _onDisconnect(event, emit);
    });
    on<ConnectFail>((event, emit) async {
      await _connectFail(event, emit);
    });
    try {
      channel = IOWebSocketChannel.connect(
          'wss://stream.binance.com:9443/ws/${url}usdt@trade');
      channel!.stream.listen((event) => add(PriceUpdate(price: event)));
    } catch (e) {
      add(ConnectFail());
    }

    // if (url.isNotEmpty) {
    //   add(ConnectToServer(url: url));
    // }
  }
  _connectFail(ConnectFail event, emit) {
    emit(ConnectError(message: ''));
  }

  _connectToServer(ConnectToServer event, Emitter emit) async {
    // channel.stream.listen((event) {
    //   Map<String, dynamic> getData = jsonDecode(event);
    //   print(event);
    //   price = getData['p'];

    //   //   emit(Connected(price: xc));
    // });
    //  emit(Connected(price: getData['p'] as String));
  }
  _onDisconnect(Disconnect event, emit) {
    channel!.sink.close();
    close();
  }

  _priceChange(PriceUpdate event, emit) async {
    Map<String, dynamic> getData = jsonDecode(event.price);
    emit(Connected(price: getData['p'] as String));
  }

  // @override
  // Stream<ConnectState> get stream => _streamController.stream;

  streamListener(emit, String price) {
    emit(Connected(price: price));
  }

  // @override
  // Future<void> close() {
  //   channel?.sink.close();
  //   return super.close();
  // }
}
