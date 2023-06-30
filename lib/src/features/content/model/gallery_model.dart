import 'dart:convert';

import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/file_picker.dart';

class GalleryModel {
  final int id;
  final String title;
  final String tanggal;
  final String url_gambar1;
  final String url_gambar2;
  final String url_gambar3;
  final String keterangan_gambar;
  final String link_more_image;
  GalleryModel({
    required this.id,
    required this.title,
    required this.tanggal,
    required this.url_gambar1,
    required this.url_gambar2,
    required this.url_gambar3,
    required this.keterangan_gambar,
    required this.link_more_image,
  });

  GalleryModel copyWith({
    int? id,
    String? title,
    String? tanggal,
    String? url_gambar1,
    String? url_gambar2,
    String? url_gambar3,
    String? keterangan_gambar,
    String? link_more_image,
  }) {
    return GalleryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      tanggal: tanggal ?? this.tanggal,
      url_gambar1: url_gambar1 ?? this.url_gambar1,
      url_gambar2: url_gambar2 ?? this.url_gambar2,
      url_gambar3: url_gambar3 ?? this.url_gambar3,
      keterangan_gambar: keterangan_gambar ?? this.keterangan_gambar,
      link_more_image: link_more_image ?? this.link_more_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tanggal': tanggal,
      'url_gambar1': url_gambar1,
      'url_gambar2': url_gambar2,
      'url_gambar3': url_gambar3,
      'keterangan_gambar': keterangan_gambar,
      'link_more_image': link_more_image,
    };
  }

  static toInsertMapString({
    required String title,
    required String tanggal,
    required String keterangan_gambar,
    required String link_more_image,
  }) {
    return {
      "title": title,
      "tanggal": tanggal,
      "keterangan_gambar": keterangan_gambar,
      "link_more_image": link_more_image,
    };
  }

  static toEditMapString({
    required String? title,
    required String? tanggal,
    required String? keterangan_gambar,
    required String? link_more_image,
  }) {
    Map data = <String, String>{};
    if (title != null) {
      data["title"] = title;
    }
    if (title != null) {
      data["tanggal"] = tanggal;
    }
    if (title != null) {
      data["keterangan_gambar"] = keterangan_gambar;
    }
    if (title != null) {
      data["link_more_image"] = link_more_image;
    }
    return data;
  }

  static toEditImage({
    required PlatformFile? image1,
    required PlatformFile? image2,
    required PlatformFile? image3,
  }) {
    Map data = <String, PlatformFile>{};
    if (image1 != null) {
      data["image1"] = image1;
    }
    if (image2 != null) {
      data["image2"] = image2;
    }
    if (image3 != null) {
      data["image3"] = image3;
    }
    return data;
  }

  static toInsertImage({
    required PlatformFile image1,
    required PlatformFile image2,
    required PlatformFile image3,
  }) {
    return {
      "image1": image1,
      "image2": image2,
      "image3": image3,
    };
  }

  factory GalleryModel.fromMap(Map<String, dynamic> map) {
    return GalleryModel(
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      tanggal: formatDate(DateTime.tryParse(map['tanggal'] as String)??DateTime.now(), isRecieved: true),
      url_gambar1: map['url_gambar1'] as String,
      url_gambar2: map['url_gambar2'] as String,
      url_gambar3: map['url_gambar3'] as String,
      keterangan_gambar: map['keterangan_gambar'] as String,
      link_more_image: map['link_more_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryModel.fromJson(String source) =>
      GalleryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GalleryModel(id: $id, title: $title, tanggal: $tanggal, url_gambar1: $url_gambar1, url_gambar2: $url_gambar2, url_gambar3: $url_gambar3, keterangan_gambar: $keterangan_gambar, link_more_image: $link_more_image)';
  }

  @override
  bool operator ==(covariant GalleryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.tanggal == tanggal &&
        other.url_gambar1 == url_gambar1 &&
        other.url_gambar2 == url_gambar2 &&
        other.url_gambar3 == url_gambar3 &&
        other.keterangan_gambar == keterangan_gambar &&
        other.link_more_image == link_more_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        tanggal.hashCode ^
        url_gambar1.hashCode ^
        url_gambar2.hashCode ^
        url_gambar3.hashCode ^
        keterangan_gambar.hashCode ^
        link_more_image.hashCode;
  }
}
