import '../../../../../core/core.dart';
import '../../../../../core/helpers/widget_helper.dart';
import '../../../bloc/coin_detail/coin_detail_bloc.dart';
import '../contracts/market.dart';
import '../views/market.dart';

class MarketScreen extends StatefulWidget {
  static const String route = '/market';
  final dynamic param;
  const MarketScreen({Key? key, this.param}) : super(key: key);

  @override
  MarketScreenController createState() => MarketScreenController();
}

class MarketScreenController extends State<MarketScreen>
    implements MarketScreenControllerContract {
  late MarketScreenViewContract view;

  @override
  void initState() {
    view = MarketScreenView(this, GetIt.I.get<IWidgetHelper>());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  Future<void> refreshData() async {
    // Simulate a delay (you can replace this with an actual data fetching operation)
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.read<CoinDetailBloc>().add(GetCoinDetailsEvent());
    }

    //
  }
}
