part of 'filter_panel_cubit.dart';

sealed class FilterPanelState extends Equatable {
  const FilterPanelState();

  @override
  List<Object> get props => [];
}

final class FilterPanelVisible extends FilterPanelState {}

final class FilterPanelHidden extends FilterPanelState {}
