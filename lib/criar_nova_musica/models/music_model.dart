// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';


class MusicModel {
  int? cdMusic;
  String? nmMusic;
  String? singer;
  String? letterMusic;
  List<int>? cdBlockMusics;
  int? cdUser;
  MusicModel({
    this.cdMusic,
    this.nmMusic,
    this.singer,
    this.letterMusic,
    this.cdBlockMusics,
    this.cdUser,
  });

  MusicModel copyWith({
    int? cdMusic,
    String? nmMusic,
    String? singer,
    String? letterMusic,
    List<int>? cdBlockMusics,
    int? cdUser,
  }) {
    return MusicModel(
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

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      cdMusic: map['cdMusic'] != null ? map['cdMusic'] as int : null,
      nmMusic: map['nmMusic'] != null ? map['nmMusic'] as String : null,
      singer: map['singer'] != null ? map['singer'] as String : null,
      letterMusic: map['letterMusic'] != null ? map['letterMusic'] as String : null,
      cdBlockMusics: map['cdBlockMusics'] != null ? List<int>.from((map['cdBlockMusics'] as List<int>)) : null,
      cdUser: map['cdUser'] != null ? map['cdUser'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicModel.fromJson(String source) => MusicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MusicModel(cdMusic: $cdMusic, nmMusic: $nmMusic, singer: $singer, letterMusic: $letterMusic, cdBlockMusics: $cdBlockMusics, cdUser: $cdUser)';
  }

  @override
  bool operator ==(covariant MusicModel other) {
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
