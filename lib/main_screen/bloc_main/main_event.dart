import 'package:equatable/equatable.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent ();
  @override
  List<Object> get props => [];
}

class OfferEvent extends MainScreenEvent {}

class ToursEvent extends MainScreenEvent {}

class MainInitialEvent extends MainScreenEvent {}

