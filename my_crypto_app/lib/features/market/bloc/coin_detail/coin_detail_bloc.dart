import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/network/network_info.dart';
import '../../../../core/data/models/coin_model.dart';
import '../../repository/imarket_repository.dart';

part 'coin_detail_event.dart';
part 'coin_detail_state.dart';

class CoinDetailBloc extends Bloc<CoinDetailEvent, CoinDetailState> {
  late IMarketRepository marketRepository;
  late NetworkInfo connectivity;

  CoinDetailBloc({required this.marketRepository, required this.connectivity}) : super(CoinDetailInitial()) {
    on<GetCoinDetailsEvent>((event, emit) => _getCoinDetails(event, emit));
  }
  _getCoinDetails(GetCoinDetailsEvent event, emit) async {
    emit(CoinDetailLoading());
    final response = await marketRepository.getCoinList();
    response.fold((l) {
      emit(CoinDetailError(message: 'Error'));
    }, (r) {
      emit(CoinDetailLoaded(coinList: r.data!));
    });
  }
}
