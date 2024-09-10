import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilteredState());

  void filter(
      void Function(FilteredState currentState, void Function(FilterState) emit)
          call) {
    if (state is FilteredState) {
      call(state as FilteredState, emit);
    }
  }
}
