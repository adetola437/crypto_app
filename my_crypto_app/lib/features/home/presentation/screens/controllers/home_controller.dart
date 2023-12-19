import 'package:my_crypto_app/features/home/bloc/favorites/favorites_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/helpers/widget_helper.dart';


import '../../../../market/bloc/coin_detail/coin_detail_bloc.dart';
import '../contracts/home_contract.dart';
import '../views/home_view.dart';

ValueNotifier<int> homeIndex = ValueNotifier(0);
ValueNotifier<ScrollController> transactionScrollController =
    ValueNotifier(ScrollController(keepScrollOffset: false));
ValueNotifier<bool> isScrolling = ValueNotifier(false);

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  HomeController createState() => HomeController();
}

class HomeController extends State<HomeScreen>
    implements HomeControllerContract {
  late HomeViewContract view;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CoinDetailBloc>().add(GetCoinDetailsEvent());
      context.read<FavoritesBloc>().add(GetFavoritesEvent());
    });
    view = HomeView(this, GetIt.I.get<IWidgetHelper>());
    super.initState();
  }

  @override
  int currentIndex = 0;

  @override
  void onItemTapped(int index) {
    homeIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
