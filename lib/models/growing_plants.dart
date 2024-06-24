import 'dart:convert';

class GrowingPlants {
  const GrowingPlants({
    required this.name,
    required this.date,
    required this.time,
    required this.comment,
    this.tizmeModel,
  });

  final String name;
  final String date;
  final String time;
  final String comment;
  final List<TizmeModel>? tizmeModel;

  GrowingPlants copyWith({
    String? name,
    String? date,
    String? time,
    String? comment,
    List<TizmeModel>? tizmeModel,
  }) {
    return GrowingPlants(
      name: name ?? this.name,
      date: date ?? this.date,
      time: time ?? this.time,
      comment: comment ?? this.comment,
      tizmeModel: tizmeModel ?? this.tizmeModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'time': time,
      'comment': comment,
      'tizmeModel': tizmeModel?.map((x) => x.toMap()).toList(),
    };
  }

  factory GrowingPlants.fromMap(Map<String, dynamic> map) {
    return GrowingPlants(
      name: map['name'],
      date: map['date'],
      time: map['time'],
      comment: map['comment'],
      tizmeModel: map['tizmeModel'] != null
          ? List<TizmeModel>.from(
              map['tizmeModel']?.map((x) => TizmeModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GrowingPlants.fromJson(String source) =>
      GrowingPlants.fromMap(json.decode(source));
}

class TizmeModel {
  TizmeModel({
    required this.nameJob,
    required this.isActive,
  });

  final String nameJob;
  bool isActive;

  Map<String, dynamic> toMap() {
    return {
      'nameJob': nameJob,
      'isActive': isActive,
    };
  }

  factory TizmeModel.fromMap(Map<String, dynamic> map) {
    return TizmeModel(
      nameJob: map['nameJob'],
      isActive: map['isActive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TizmeModel.fromJson(String source) =>
      TizmeModel.fromMap(json.decode(source));
}
