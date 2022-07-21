import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitialState extends MainState {}

class MainLoadingState extends MainState {}

class OfferScreenState extends MainState {}

class OfferScreenLoading extends MainState {}

class ToursScreenState extends MainState {}

class ToursScreenLoading extends MainState {}
