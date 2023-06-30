// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:beaverbasketball/src/src.dart';
import 'package:collection/collection.dart';

class ScheduleModel {
  final String day;
  final String title;
  final String tanggal;
  final int id;
  final String tipe;
  final String description;
  ScheduleModel({
    required this.day,
    required this.title,
    required this.tanggal,
    required this.id,
    required this.tipe,
    required this.description,
  });

  ScheduleModel copyWith({
    String? day,
    String? title,
    String? tanggal,
    String? tipe,
    String? description,
  }) {
    return ScheduleModel(
      day: day ?? this.day,
      title: title ?? this.title,
      tanggal: tanggal ?? this.tanggal,
      tipe: tipe ?? this.tipe,
      description: description ?? this.description, id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'title': title,
      'tanggal': tanggal,
      'tipe': tipe,
      'description': description,
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      id: map["id"],
      day: map['day'] as String,
      title: map['title'] as String,
      tanggal: formatDate(DateTime.tryParse(map['tanggal'] as String)??DateTime.now(), isRecieved: true),
      tipe: map['tipe'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) =>
      ScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScheduleModel(day: $day, title: $title, tanggal: $tanggal, tipe: $tipe, description: $description)';
  }

  @override
  bool operator ==(covariant ScheduleModel other) {
    if (identical(this, other)) return true;

    return other.day == day &&
        other.title == title &&
        other.tanggal == tanggal &&
        other.tipe == tipe &&
        other.description == description;
  }

  @override
  int get hashCode {
    return day.hashCode ^
        title.hashCode ^
        tanggal.hashCode ^
        tipe.hashCode ^
        description.hashCode;
  }
}

extension ToListSchedule on Iterable<ScheduleModel> {
  Map<String, List<ScheduleModel>> groupByType() {
    return groupBy(this, (value) {
      return value.tipe;
    });
  }

  Map<String, List<ScheduleModel>> groupByDay() {
    return groupBy(this, (value) {
      return value.day;
    });
  }
}
