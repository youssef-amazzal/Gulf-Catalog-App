part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccessfulFetching extends DetailsState {
  final Product product;

  const DetailsSuccessfulFetching({required this.product});
}

final class DetailsFailedFetching extends DetailsState {
  final String message;

  const DetailsFailedFetching({required this.message});
}
