part of 'chart_bloc.dart';

abstract class ChartEvent extends Equatable {
  const ChartEvent();

  @override
  List<Object> get props => [];
}

class GetOhlcEvent extends ChartEvent {
 final String day;
 final String coin;

 const GetOhlcEvent({required this.coin, required this.day});
}
