import 'dart:convert';

import 'package:beaverbasketball/src/features/content/providers/achievement_providers.dart';

class UserModel {
  final int id;
  final String nama_lengkap;
  final String tanggal_lahir;
  final String tempat_lahir;
  final String jenis_kelamin;
  final String alamat;
  final String nomor_wa;
  final String asal_sekolah;
  final String nama_bpk;
  final String nomor_bpk;
  final String nama_ibu;
  final String nomor_ibu;
  final String ukuran_jersey;
  final String dokumen_kk;
  final String cabang_daftar;
  final String dokumen_akta;
  UserModel({
    required this.id,
    required this.nama_lengkap,
    required this.tanggal_lahir,
    required this.tempat_lahir,
    required this.jenis_kelamin,
    required this.alamat,
    required this.nomor_wa,
    required this.asal_sekolah,
    required this.nama_bpk,
    required this.nomor_bpk,
    required this.nama_ibu,
    required this.nomor_ibu,
    required this.ukuran_jersey,
    required this.dokumen_kk,
    required this.cabang_daftar,
    required this.dokumen_akta,
  });

  UserModel copyWith({
    int? id,
    String? nama_lengkap,
    String? tanggal_lahir,
    String? tempat_lahir,
    String? jenis_kelamin,
    String? alamat,
    String? nomor_wa,
    String? asal_sekolah,
    String? nama_bpk,
    String? nomor_bpk,
    String? nama_ibu,
    String? nomor_ibu,
    String? ukuran_jersey,
    String? dokumen_kk,
    String? cabang_daftar,
    String? dokumen_akta,
  }) {
    return UserModel(
      id: id ?? this.id,
      nama_lengkap: nama_lengkap ?? this.nama_lengkap,
      tanggal_lahir: tanggal_lahir ?? this.tanggal_lahir,
      tempat_lahir: tempat_lahir ?? this.tempat_lahir,
      jenis_kelamin: jenis_kelamin ?? this.jenis_kelamin,
      alamat: alamat ?? this.alamat,
      nomor_wa: nomor_wa ?? this.nomor_wa,
      asal_sekolah: asal_sekolah ?? this.asal_sekolah,
      nama_bpk: nama_bpk ?? this.nama_bpk,
      nomor_bpk: nomor_bpk ?? this.nomor_bpk,
      nama_ibu: nama_ibu ?? this.nama_ibu,
      nomor_ibu: nomor_ibu ?? this.nomor_ibu,
      ukuran_jersey: ukuran_jersey ?? this.ukuran_jersey,
      dokumen_kk: dokumen_kk ?? this.dokumen_kk,
      cabang_daftar: cabang_daftar ?? this.cabang_daftar,
      dokumen_akta: dokumen_akta ?? this.dokumen_akta,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama_lengkap': nama_lengkap,
      'tanggal_lahir': tanggal_lahir,
      'tempat_lahir': tempat_lahir,
      'jenis_kelamin': jenis_kelamin,
      'alamat': alamat,
      'nomor_wa': nomor_wa,
      'asal_sekolah': asal_sekolah,
      'nama_bpk': nama_bpk,
      'nomor_bpk': nomor_bpk,
      'nama_ibu': nama_ibu,
      'nomor_ibu': nomor_ibu,
      'ukuran_jersey': ukuran_jersey,
      'dokumen_kk': dokumen_kk,
      'cabang_daftar': cabang_daftar,
      'dokumen_akta': dokumen_akta,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      nama_lengkap: map['nama_lengkap'] as String,
      tanggal_lahir: map['tanggal_lahir'] as String,
      tempat_lahir: map['tempat_lahir'] as String,
      jenis_kelamin: map['jenis_kelamin'] as String,
      alamat: map['alamat'] as String,
      nomor_wa: map['nomor_wa'] as String,
      asal_sekolah: map['asal_sekolah'] as String,
      nama_bpk: map['nama_bpk'] as String,
      nomor_bpk: map['nomor_bpk'] as String,
      nama_ibu: map['nama_ibu'] as String,
      nomor_ibu: map['nomor_ibu'] as String,
      ukuran_jersey: map['ukuran_jersey'] as String,
      dokumen_kk: map['dokumen_kk'] as String,
      cabang_daftar: map['cabang_daftar'] as String,
      dokumen_akta: map['dokumen_akta'] as String,
    );
  }

  String get tanggal => formatDateWithMonthName(tanggal_lahir, isChanged: true);
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, nama_lengkap: $nama_lengkap, tanggal_lahir: $tanggal_lahir, tempat_lahir: $tempat_lahir, jenis_kelamin: $jenis_kelamin, alamat: $alamat, nomor_wa: $nomor_wa, asal_sekolah: $asal_sekolah, nama_bpk: $nama_bpk, nomor_bpk: $nomor_bpk, nama_ibu: $nama_ibu, nomor_ibu: $nomor_ibu, ukuran_jersey: $ukuran_jersey, dokumen_kk: $dokumen_kk, cabang_daftar: $cabang_daftar, dokumen_akta: $dokumen_akta)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nama_lengkap == nama_lengkap &&
        other.tanggal_lahir == tanggal_lahir &&
        other.tempat_lahir == tempat_lahir &&
        other.jenis_kelamin == jenis_kelamin &&
        other.alamat == alamat &&
        other.nomor_wa == nomor_wa &&
        other.asal_sekolah == asal_sekolah &&
        other.nama_bpk == nama_bpk &&
        other.nomor_bpk == nomor_bpk &&
        other.nama_ibu == nama_ibu &&
        other.nomor_ibu == nomor_ibu &&
        other.ukuran_jersey == ukuran_jersey &&
        other.dokumen_kk == dokumen_kk &&
        other.cabang_daftar == cabang_daftar &&
        other.dokumen_akta == dokumen_akta;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nama_lengkap.hashCode ^
        tanggal_lahir.hashCode ^
        tempat_lahir.hashCode ^
        jenis_kelamin.hashCode ^
        alamat.hashCode ^
        nomor_wa.hashCode ^
        asal_sekolah.hashCode ^
        nama_bpk.hashCode ^
        nomor_bpk.hashCode ^
        nama_ibu.hashCode ^
        nomor_ibu.hashCode ^
        ukuran_jersey.hashCode ^
        dokumen_kk.hashCode ^
        cabang_daftar.hashCode ^
        dokumen_akta.hashCode;
  }
}
