part of 'chart_bloc.dart';

sealed class ChartState extends Equatable {
  const ChartState();

  @override
  List<Object> get props => [];
}

final class ChartInitial extends ChartState {}

final class ChartLoading extends ChartState {}

final class ChartLoadingError extends ChartState {}

final class ChartLoaded extends ChartState {
  final List<ChartModel> ohlc;

 const ChartLoaded({required this.ohlc});
}
