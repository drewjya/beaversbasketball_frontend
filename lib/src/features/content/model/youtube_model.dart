// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YoutubeModel {
  final String id;
  final DateTime publishedAt;
  final String thumbnail;
  final String title;
  YoutubeModel({
    required this.id,
    required this.publishedAt,
    required this.thumbnail,
    required this.title,
  });
  

  YoutubeModel copyWith({
    String? id,
    DateTime? publishedAt,
    String? thumbnail,
    String? title,
  }) {
    return YoutubeModel(
      id: id ?? this.id,
      publishedAt: publishedAt ?? this.publishedAt,
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'publishedAt': publishedAt.millisecondsSinceEpoch,
      'thumbnail': thumbnail,
      'title': title,
    };
  }

  factory YoutubeModel.fromMap(Map<String, dynamic> map) {
    return YoutubeModel(
      id: map['id']["videoId"] as String,
      publishedAt: DateTime.parse(map["snippet"]['publishedAt'] as String),
      thumbnail: map["snippet"]["thumbnails"]["high"]['url'] as String,
      title: map["snippet"]['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YoutubeModel.fromJson(String source) => YoutubeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YoutubeModel(id: $id, publishedAt: $publishedAt, thumbnail: $thumbnail, title: $title)';
  }

  @override
  bool operator ==(covariant YoutubeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.publishedAt == publishedAt &&
      other.thumbnail == thumbnail &&
      other.title == title;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      publishedAt.hashCode ^
      thumbnail.hashCode ^
      title.hashCode;
  }
}
