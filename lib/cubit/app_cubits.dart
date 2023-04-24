import 'package:bloc/bloc.dart';
import 'package:trip_seller/cubit/app_cubit_states.dart';
import 'package:trip_seller/services/data_services.dart';

import '../model/data_model.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices _data;
  late final List<DataModel> _places;

  AppCubits({required DataServices data}): _data = data, super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() async {
    try{
      emit(LoadingState());
      _places = await _data.getInfo();
      emit(LoadedState(_places));
    }catch(e) {
      print(e);
    }
  }

  void detailsPage(DataModel data) {
    emit(DetailState(data));
  }

  void goHome() {
    emit(LoadedState(_places));
  }
}