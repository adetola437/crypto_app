

import 'config/di/app_initializer.dart';

import 'core/core.dart';
import 'crypto_app.dart';

void main() async {
  await AppInitializer.initGetIt();
  
  runApp(const CryptoApp());
  //FlutterNativeSplash.remove();
}
