import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImplementation implements NetworkInfo {

  static NetworkInfoImplementation get instance => GetIt.I<NetworkInfoImplementation>();

  @override
  Future<bool> isConnected() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}