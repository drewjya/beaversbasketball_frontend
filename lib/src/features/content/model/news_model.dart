import 'dart:convert';

import 'package:beaverbasketball/src/features/content/providers/achievement_providers.dart';
import 'package:beaverbasketball/src/src.dart';

class NewsModel {
  final int id;
  final String title;
  final String tanggal;
  final String url_gambar;
  final String description;
  NewsModel({
    required this.id,
    required this.title,
    required this.tanggal,
    required this.url_gambar,
    required this.description,
  });
  DateTime get date => DateTime.parse(tanggal);
  NewsModel copyWith({
    int? id,
    String? title,
    String? tanggal,
    String? url_gambar,
    String? description,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      tanggal: tanggal ?? this.tanggal,
      url_gambar: url_gambar ?? this.url_gambar,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tanggal': tanggal,
      'url_gambar': url_gambar,
      'description': description,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      tanggal: formatDateWithMonthName(formatDate(
          DateTime.tryParse(map['tanggal'] as String) ?? DateTime.now(),
          isRecieved: true)),
      url_gambar: map['url_gambar'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, tanggal: $tanggal, url_gambar: $url_gambar, description: $description)';
  }

  @override
  bool operator ==(covariant NewsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.tanggal == tanggal &&
        other.url_gambar == url_gambar &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        tanggal.hashCode ^
        url_gambar.hashCode ^
        description.hashCode;
  }
}
