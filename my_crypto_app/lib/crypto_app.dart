
import 'package:my_crypto_app/features/home/bloc/favorites/favorites_bloc.dart';
import 'package:my_crypto_app/features/home/bloc/portfolio/portfolio_bloc.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'core/core.dart';
import 'core/theme/theme.dart';
import 'features/home/bloc/chart/chart_bloc.dart';
import 'features/market/bloc/coin_detail/coin_detail_bloc.dart';



export 'package:responsive_framework/responsive_framework.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:  [
        BlocProvider(
          create: (_) => GetIt.I.get<PortfolioBloc>(),
        ),
          BlocProvider(
          create: (_) => GetIt.I.get<CoinDetailBloc>(),
        ),
          BlocProvider(
          create: (_) => GetIt.I.get<FavoritesBloc>(),
        ),
          BlocProvider(
          create: (_) => GetIt.I.get<ChartBloc>(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          // splitScreenMode: false,
          // scaleByHeight: true,
          rebuildFactor: (old, data) {
            return true;
          },
          builder: (context, child) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: routeConfig,
               theme: AppTheme.light,
                // darkTheme: AppTheme.dark,
                themeMode: ThemeMode.light,

                builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                  ],
                ),
              )),
    );
  }
}
