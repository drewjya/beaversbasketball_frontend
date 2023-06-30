import 'dart:convert';

import 'package:beaverbasketball/src/features/content/view/registration/registration_view.dart';

class AchievementModel {
  final int id;
  final String title;
  final String tanggal;
  final String url_gambar;
  final String keterangan_gambar;
  final String description;
  AchievementModel({
    required this.id,
    required this.title,
    required this.tanggal,
    required this.url_gambar,
    required this.keterangan_gambar,
    required this.description,
  });

  AchievementModel copyWith({
    int? id,
    String? title,
    String? tanggal,
    String? url_gambar,
    String? keterangan_gambar,
    String? description,
  }) {
    return AchievementModel(
      id: id ?? this.id,
      title: title ?? this.title,
      tanggal: tanggal ?? this.tanggal,
      url_gambar: url_gambar ?? this.url_gambar,
      keterangan_gambar: keterangan_gambar ?? this.keterangan_gambar,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tanggal': tanggal,
      'url_gambar': url_gambar,
      'keterangan_gambar': keterangan_gambar,
      'description': description,
    };
  }

  factory AchievementModel.fromMap(Map<String, dynamic> map) {
    return AchievementModel(
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      tanggal: formatDate(DateTime.tryParse(map['tanggal'] as String)??DateTime.now(), isRecieved: true),
      url_gambar: map['url_gambar'] as String,
      keterangan_gambar: map['keterangan_gambar'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AchievementModel.fromJson(String source) => AchievementModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AchievementModel(id: $id, title: $title, tanggal: $tanggal, url_gambar: $url_gambar, keterangan_gambar: $keterangan_gambar, description: $description)';
  }

  @override
  bool operator ==(covariant AchievementModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.tanggal == tanggal &&
      other.url_gambar == url_gambar &&
      other.keterangan_gambar == keterangan_gambar &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      tanggal.hashCode ^
      url_gambar.hashCode ^
      keterangan_gambar.hashCode ^
      description.hashCode;
  }
}