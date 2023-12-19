import '../../core/core.dart';
import '../../crypto_app.dart';
import '../di/app_initializer.dart';
import 'flavor.dart';


void main() async {
  BuildFlavor.init(
    flavor: Flavor.release,
    baseUrl: 'baseUrl',
    appName: 'Exchange',
    encKey: '',
    vector: '',
  );
  await AppInitializer.initGetIt();
  runApp(const CryptoApp());
}