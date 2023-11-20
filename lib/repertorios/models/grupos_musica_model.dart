// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:music_app/criar_nova_musica/models/music_model.dart';

class GruposMusicaModel {
  int? cdGender;
  int? cdUser;
  String? nmGender;
  List<MusicModel> musics;
  GruposMusicaModel({
    this.cdGender,
    this.nmGender,
    this.cdUser,
    required this.musics,
  });
 

  GruposMusicaModel copyWith({
    int? cdGender,
    int? cdUser,
    String? nmGender,
    List<MusicModel>? musics,
  }) {
    return GruposMusicaModel(
      cdGender: cdGender ?? this.cdGender,
      cdUser: cdUser ?? this.cdUser,
      nmGender: nmGender ?? this.nmGender,
      musics: musics ?? this.musics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cdGender': cdGender,
      'cdUser': cdUser,
      'nmGender': nmGender,
      'musics': musics.map((x) => x.toMap()).toList(),
    };
  }

   factory GruposMusicaModel.fromMap(Map<String, dynamic> map) {
    return GruposMusicaModel(
      cdGender: map['cdGender'] != null ? map['cdGender'] as int : null,
      cdUser: map['cdUser'] != null ? map['cdUser'] as int : null,
      nmGender: map['nmGender'] != null ? map['nmGender'] as String : null,
      musics: map['musics'] != null
          ? List<MusicModel>.from((map['musics'] as List<dynamic>)
              .map((music) => MusicModel.fromMap(music)))
          : [], // Empty list as default or handle null based on your API response
    );
  }

  // factory GruposMusicaModel.fromMap(Map<String, dynamic> map) {
  //   return GruposMusicaModel(
  //     cdGender: map['cdGender'] != null ? map['cdGender'] as int : null,
  //     nmGender: map['nmGender'] != null ? map['nmGender'] as String : null,
  //     musics: List<MusicModel>.from((map['musics'] as List<int>).map<MusicModel>((x) => MusicModel.fromMap(x as Map<String,dynamic>),),),
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory GruposMusicaModel.fromJson(String source) => GruposMusicaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GruposMusicaModel(cdGender: $cdGender, nmGender: $nmGender, musics: $musics, cdUser: $cdUser)';

  @override
  bool operator ==(covariant GruposMusicaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cdGender == cdGender &&
      other.nmGender == nmGender &&
      listEquals(other.musics, musics);
  }

  @override
  int get hashCode => cdGender.hashCode ^ nmGender.hashCode ^ musics.hashCode;
}
