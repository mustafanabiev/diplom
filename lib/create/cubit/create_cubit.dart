import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/growing_plants.dart';

part 'create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(const CreateState(growingPlants: [])) {
    _loadState();
  }

  void saveDate(TypeDateTime type, String data) {
    if (TypeDateTime.date == type) {
      emit(state.copyWith(date: data));
    } else {
      emit(state.copyWith(time: data));
    }
    _saveState();
  }

  void addPlants(GrowingPlants growingPlants) {
    final plants = List<GrowingPlants>.from(state.growingPlants)
      ..add(growingPlants);
    emit(state.copyWith(growingPlants: plants));
    _saveState();
  }

  void removePlants(GrowingPlants growingPlants) {
    final plants = List<GrowingPlants>.from(state.growingPlants)
      ..remove(growingPlants);
    emit(state.copyWith(growingPlants: plants));
    _saveState();
  }

  Future<void> _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('date', state.date ?? '');
    prefs.setString('time', state.time ?? '');
    prefs.setStringList('growingPlants',
        state.growingPlants.map((plant) => plant.toJson()).toList());
  }

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final date = prefs.getString('date');
    final time = prefs.getString('time');
    final plantsJson = prefs.getStringList('growingPlants');

    final plants = plantsJson != null
        ? plantsJson.map((json) => GrowingPlants.fromJson(json)).toList()
        : <GrowingPlants>[];

    emit(CreateState(
      date: date,
      time: time,
      growingPlants: plants,
    ));
  }
}

enum TypeDateTime { date, time }
