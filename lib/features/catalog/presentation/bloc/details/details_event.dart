part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

final class DetailsFetchEvent extends DetailsEvent {
  final int productId;

  const DetailsFetchEvent({required this.productId});
}
