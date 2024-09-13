part of 'filter_cubit.dart';

sealed class FilterState {
  const FilterState();
}

final class FilteredState extends FilterState {
  final Availability availability;
  final PinState? pinState;
  final String? category;
  final SortBy? sortBy;

  const FilteredState({
    this.category,
    this.availability = Availability.all,
    this.pinState,
    this.sortBy,
  });

  // copy with
  FilteredState copyWith({
    Availability? availability,
    String? category,
    PinState? pinState,
    SortBy? sortBy,
  }) {
    return FilteredState(
      availability: availability ?? this.availability,
      category: category ?? this.category,
      pinState: pinState ?? this.pinState,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

enum Availability { all, inStock, outOfStock }

enum PinState { pinned, unpinned }

enum SortBy {
  alphaAsc,
  alphaDesc,
  stockAsc,
  stockDesc,
  priceAsc,
  priceDesc,
  updatedAsc,
  updatedDesc
}
