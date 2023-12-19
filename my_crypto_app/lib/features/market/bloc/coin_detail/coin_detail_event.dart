part of 'coin_detail_bloc.dart';

abstract class CoinDetailEvent extends Equatable {
  const CoinDetailEvent();

  @override
  List<Object> get props => [];
}
class GetCoinDetailsEvent extends CoinDetailEvent{}