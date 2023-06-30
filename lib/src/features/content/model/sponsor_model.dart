import 'dart:convert';

class SponsorModel {
  final int id;
  final String nama_sponsor;
  final String url_gambar;
  SponsorModel({
    required this.id,
    required this.nama_sponsor,
    required this.url_gambar,
  });

  SponsorModel copyWith({
    int? id,
    String? nama_sponsor,
    String? url_gambar,
  }) {
    return SponsorModel(
      id: id ?? this.id,
      nama_sponsor: nama_sponsor ?? this.nama_sponsor,
      url_gambar: url_gambar ?? this.url_gambar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama_sponsor': nama_sponsor,
      'url_gambar': url_gambar,
    };
  }

  factory SponsorModel.fromMap(Map<String, dynamic> map) {
    return SponsorModel(
      id: map['id'].toInt() as int,
      nama_sponsor: map['nama_sponsor'] as String,
      url_gambar: map['url_gambar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SponsorModel.fromJson(String source) => SponsorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SponsorModel(id: $id, nama_sponsor: $nama_sponsor, url_gambar: $url_gambar)';

  @override
  bool operator ==(covariant SponsorModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nama_sponsor == nama_sponsor &&
      other.url_gambar == url_gambar;
  }

  @override
  int get hashCode => id.hashCode ^ nama_sponsor.hashCode ^ url_gambar.hashCode;
}