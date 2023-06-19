import 'dart:convert';

class CoachModel {
  final int id;
  final String nama;
  final String url_gambar;
  final String keterangan_coach;
  final String created_at;
  final String updated_at;
  final String? deleted_at;
  CoachModel({
    required this.id,
    required this.nama,
    required this.url_gambar,
    required this.keterangan_coach,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  CoachModel copyWith({
    int? id,
    String? nama,
    String? url_gambar,
    String? keterangan_coach,
    String? created_at,
    String? updated_at,
    String? deleted_at,
  }) {
    return CoachModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      url_gambar: url_gambar ?? this.url_gambar,
      keterangan_coach: keterangan_coach ?? this.keterangan_coach,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'url_gambar': url_gambar,
      'keterangan_coach': keterangan_coach,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  factory CoachModel.fromMap(Map<String, dynamic> map) {
    return CoachModel(
      id: map['id'].toInt() as int,
      nama: map['nama'] as String,
      url_gambar: map['url_gambar'] as String,
      keterangan_coach: map['keterangan_coach'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      deleted_at: map['deleted_at'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoachModel.fromJson(String source) => CoachModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoachModel(id: $id, nama: $nama, url_gambar: $url_gambar, keterangan_coach: $keterangan_coach, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(covariant CoachModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nama == nama &&
      other.url_gambar == url_gambar &&
      other.keterangan_coach == keterangan_coach &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.deleted_at == deleted_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nama.hashCode ^
      url_gambar.hashCode ^
      keterangan_coach.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      deleted_at.hashCode;
  }
}
