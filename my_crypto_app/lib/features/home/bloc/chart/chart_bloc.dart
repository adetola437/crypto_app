import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_crypto_app/core/data/models/chart_model.dart';

import '../../repository/ihome_repository.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  late IHomeRepository homeRepository;
  ChartBloc({required this.homeRepository}) : super(ChartInitial()) {
    on<GetOhlcEvent>((event, emit) => _getOhlc(event, emit));
  }

  _getOhlc(GetOhlcEvent event, emit) async {
    emit(ChartLoading());
    final response = await homeRepository.getOhlc(day: event.day, symbol: event.coin);
    response.fold((l) {
      emit(ChartLoadingError());
    }, (r) {
      emit(ChartLoaded(ohlc: r.data!));
    });
  }
}
