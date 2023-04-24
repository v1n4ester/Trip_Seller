import 'package:equatable/equatable.dart';
import 'package:trip_seller/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  final List<DataModel> places;
  LoadedState(this.places);
  @override
  List<Object?> get props => [places];
}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => [];
}

// class MainState extends CubitStates {
//   @override
//   List<Object?> get props => [];
// }

class DetailState extends CubitStates {
  final DataModel place;
  DetailState(this.place);
  @override
  List<Object?> get props => [place];
}