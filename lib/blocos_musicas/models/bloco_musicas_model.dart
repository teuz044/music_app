// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:music_app/criar_nova_musica/models/music_model.dart';

class BlocoMusicasModel {
  int? cdBlockMusic;
  String? nmBlockMusic;
  int? cdRepertoire;
  List<MusicModel> cdMusics;
  int? cdUser;
  BlocoMusicasModel({
    this.cdBlockMusic,
    this.nmBlockMusic,
    this.cdRepertoire,
    required this.cdMusics,
    this.cdUser,
  });


  BlocoMusicasModel copyWith({
    int? cdBlockMusic,
    String? nmBlockMusic,
    int? cdRepertoire,
    List<MusicModel>? cdMusics,
    int? cdUser,
  }) {
    return BlocoMusicasModel(
      cdBlockMusic: cdBlockMusic ?? this.cdBlockMusic,
      nmBlockMusic: nmBlockMusic ?? this.nmBlockMusic,
      cdRepertoire: cdRepertoire ?? this.cdRepertoire,
      cdMusics: cdMusics ?? this.cdMusics,
      cdUser: cdUser ?? this.cdUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cdBlockMusic': cdBlockMusic,
      'nmBlockMusic': nmBlockMusic,
      'cdRepertoire': cdRepertoire,
      'cdMusics': cdMusics.map((x) => x.toMap()).toList(),
      'cdUser': cdUser,
    };
  }

  factory BlocoMusicasModel.fromMap(Map<String, dynamic> map) {
    return BlocoMusicasModel(
      cdBlockMusic: map['cdBlockMusic'] != null ? map['cdBlockMusic'] as int : null,
      nmBlockMusic: map['nmBlockMusic'] != null ? map['nmBlockMusic'] as String : null,
      cdRepertoire: map['cdRepertoire'] != null ? map['cdRepertoire'] as int : null,
      cdMusics: List<MusicModel>.from((map['cdMusics'] as List<dynamic>).map<MusicModel>((x) => MusicModel.fromMap(x as Map<String,dynamic>),),),
      cdUser: map['cdUser'] != null ? map['cdUser'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlocoMusicasModel.fromJson(String source) => BlocoMusicasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BlocoMusicasModel(cdBlockMusic: $cdBlockMusic, nmBlockMusic: $nmBlockMusic, cdRepertoire: $cdRepertoire, cdMusics: $cdMusics, cdUser: $cdUser)';
  }

  @override
  bool operator ==(covariant BlocoMusicasModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cdBlockMusic == cdBlockMusic &&
      other.nmBlockMusic == nmBlockMusic &&
      other.cdRepertoire == cdRepertoire &&
      listEquals(other.cdMusics, cdMusics) &&
      other.cdUser == cdUser;
  }

  @override
  int get hashCode {
    return cdBlockMusic.hashCode ^
      nmBlockMusic.hashCode ^
      cdRepertoire.hashCode ^
      cdMusics.hashCode ^
      cdUser.hashCode;
  }
}
