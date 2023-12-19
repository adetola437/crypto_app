part of 'coin_detail_bloc.dart';

abstract class CoinDetailState extends Equatable {
  const CoinDetailState();

  @override
  List<Object> get props => [];
}

final class CoinDetailInitial extends CoinDetailState {}

final class CoinDetailLoading extends CoinDetailState {}

final class CoinDetailLoaded extends CoinDetailState {
  List<CoinModel> coinList;

  CoinDetailLoaded({required this.coinList});
    @override
  List<Object> get props => [coinList];
}
final class CoinDetailError extends CoinDetailState {
  String message;

  CoinDetailError({required this.message});
    @override
  List<Object> get props => [];
}
