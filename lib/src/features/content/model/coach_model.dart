// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CoachModel {
  final int id;
  final String nama;
  final String url_gambar;
  final String keterangan_coach;
  CoachModel({
    required this.id,
    required this.nama,
    required this.url_gambar,
    required this.keterangan_coach,
  });

  CoachModel copyWith({
    int? id,
    String? nama,
    String? url_gambar,
    String? keterangan_coach,
  }) {
    return CoachModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      url_gambar: url_gambar ?? this.url_gambar,
      keterangan_coach: keterangan_coach ?? this.keterangan_coach,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'url_gambar': url_gambar,
      'keterangan_coach': keterangan_coach,
    };
  }

  factory CoachModel.fromMap(Map<String, dynamic> map) {
    return CoachModel(
      id: map['id'] as int,
      nama: map['nama'] as String,
      url_gambar: map['url_gambar'] as String,
      keterangan_coach: map['keterangan_coach'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoachModel.fromJson(String source) =>
      CoachModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoachModel(id: $id, nama: $nama, url_gambar: $url_gambar, keterangan_coach: $keterangan_coach)';
  }

  @override
  bool operator ==(covariant CoachModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nama == nama &&
        other.url_gambar == url_gambar &&
        other.keterangan_coach == keterangan_coach;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nama.hashCode ^
        url_gambar.hashCode ^
        keterangan_coach.hashCode;
  }
}
