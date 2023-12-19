import 'package:go_router/go_router.dart';
import 'package:my_crypto_app/core/data/models/coin_model.dart';
import 'package:my_crypto_app/features/home/presentation/screens/controllers/coin_details.dart';
import 'package:my_crypto_app/features/home/presentation/widgets/coin_detail.dart';

import '../../features/home/presentation/screens/controllers/home_controller.dart';
import '../core.dart';

final rootScaffoldKey = GlobalKey<ScaffoldState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter routeConfig = GoRouter(
    debugLogDiagnostics: true,
    //  initialLocation: LoginScreen.route,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: "/",
         builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
     
      ),
        GoRoute(
        path: CoinDetailsScreen.route,
         builder: (BuildContext context, GoRouterState state) {
          return  CoinDetailsScreen(coin: state.extra as CoinModel,);
        },
     
      ),
     
    ]);
