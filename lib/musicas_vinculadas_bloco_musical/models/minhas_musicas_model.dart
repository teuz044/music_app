// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';


class MinhasMusicasModel {
  int? cdMusic;
  String? nmMusic;
  String? singer;
  String? letterMusic;
  List<int>? cdBlockMusics;
  int? cdUser;
  MinhasMusicasModel({
    this.cdMusic,
    this.nmMusic,
    this.singer,
    this.letterMusic,
    this.cdBlockMusics,
    this.cdUser,
  });

  MinhasMusicasModel copyWith({
    int? cdMusic,
    String? nmMusic,
    String? singer,
    String? letterMusic,
    List<int>? cdBlockMusics,
    int? cdUser,
  }) {
    return MinhasMusicasModel(
      cdMusic: cdMusic ?? this.cdMusic,
      nmMusic: nmMusic ?? this.nmMusic,
      singer: singer ?? this.singer,
      letterMusic: letterMusic ?? this.letterMusic,
      cdBlockMusics: cdBlockMusics ?? this.cdBlockMusics,
      cdUser: cdUser ?? this.cdUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cdMusic': cdMusic,
      'nmMusic': nmMusic,
      'singer': singer,
      'letterMusic': letterMusic,
      'cdBlockMusics': cdBlockMusics,
      'cdUser': cdUser,
    };
  }

  factory MinhasMusicasModel.fromMap(Map<String, dynamic> map) {
    return MinhasMusicasModel(
      cdMusic: map['cdMusic'] != null ? map['cdMusic'] as int : null,
      nmMusic: map['nmMusic'] != null ? map['nmMusic'] as String : null,
      singer: map['singer'] != null ? map['singer'] as String : null,
      letterMusic: map['letterMusic'] != null ? map['letterMusic'] as String : null,
      cdBlockMusics: map['cdBlockMusics'] != null ? List<int>.from((map['cdBlockMusics'] as List<int>)) : null,
      cdUser: map['cdUser'] != null ? map['cdUser'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MinhasMusicasModel.fromJson(String source) => MinhasMusicasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MinhasMusicasModel(cdMusic: $cdMusic, nmMusic: $nmMusic, singer: $singer, letterMusic: $letterMusic, cdBlockMusics: $cdBlockMusics, cdUser: $cdUser)';
  }

  @override
  bool operator ==(covariant MinhasMusicasModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cdMusic == cdMusic &&
      other.nmMusic == nmMusic &&
      other.singer == singer &&
      other.letterMusic == letterMusic &&
      listEquals(other.cdBlockMusics, cdBlockMusics) &&
      other.cdUser == cdUser;
  }

  @override
  int get hashCode {
    return cdMusic.hashCode ^
      nmMusic.hashCode ^
      singer.hashCode ^
      letterMusic.hashCode ^
      cdBlockMusics.hashCode ^
      cdUser.hashCode;
  }
}
