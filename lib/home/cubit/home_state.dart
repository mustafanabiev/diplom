part of 'home_cubit.dart';

class HomeState {
  HomeState({
    required this.plantModel,
    required this.plantModel2,
    this.plant,
  });
  final List<PlantModel> plantModel;
  final List<PlantModel> plantModel2;
  final PlantModel? plant;

  HomeState copyWith({
    List<PlantModel>? plantModel,
    List<PlantModel>? plantModel2,
    PlantModel? plant,
  }) {
    return HomeState(
      plantModel: plantModel ?? this.plantModel,
      plantModel2: plantModel2 ?? this.plantModel2,
      plant: plant ?? this.plant,
    );
  }
}
