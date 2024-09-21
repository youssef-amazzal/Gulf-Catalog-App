import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_panel_state.dart';

class FilterPanelCubit extends Cubit<FilterPanelState> {
  FilterPanelCubit() : super(FilterPanelVisible());

  void toggleVisibility() {
    if (state is FilterPanelVisible) {
      emit(FilterPanelHidden());
    } else {
      emit(FilterPanelVisible());
    }
  }
}
