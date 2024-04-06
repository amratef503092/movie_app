part of 'home_layout_cubit.dart';

abstract class HomeLayoutState extends Equatable {
  const HomeLayoutState();

  @override
  List<Object> get props => [];
}

class HomeLayoutInitial extends HomeLayoutState {}
class HomeLayoutChangePage extends HomeLayoutState {
  final int index;
  const HomeLayoutChangePage(this.index);

  @override
  List<Object> get props => [index];
}
