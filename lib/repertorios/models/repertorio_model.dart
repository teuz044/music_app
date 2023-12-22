// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:music_app/criar_nova_musica/models/music_model.dart';

import '../../blocos_musicas/models/bloco_musicas_model.dart';

class RepertorioModel {
  int? cdRepertoire;
  int? cdUser;
  String? nmRepertoire;
  List<int>? cdBlockMusics;
  RepertorioModel({
    this.cdRepertoire,
    this.cdUser,
    this.nmRepertoire,
    this.cdBlockMusics,
  });
  



  RepertorioModel copyWith({
    int? cdRepertoire,
    int? cdUser,
    String? nmRepertoire,
    List<int>? cdBlockMusics,
  }) {
    return RepertorioModel(
      cdRepertoire: cdRepertoire ?? this.cdRepertoire,
      cdUser: cdUser ?? this.cdUser,
      nmRepertoire: nmRepertoire ?? this.nmRepertoire,
      cdBlockMusics: cdBlockMusics ?? this.cdBlockMusics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cdRepertoire': cdRepertoire,
      'cdUser': cdUser,
      'nmRepertoire': nmRepertoire,
      'cdBlockMusics': cdBlockMusics,
    };
  }

  factory RepertorioModel.fromMap(Map<String, dynamic> map) {
  return RepertorioModel(
    cdRepertoire: map['cdRepertoire'] != null ? map['cdRepertoire'] as int? : null,
    cdUser: map['cdUser'] != null ? map['cdUser'] as int? : null,
    nmRepertoire: map['nmRepertoire'] != null ? map['nmRepertoire'] as String? : null,
    cdBlockMusics: (map['cdBlockMusics'] != null)
        ? List<int>.from(map['cdBlockMusics'] as List<dynamic>)
        : null,
  );
}
  String toJson() => json.encode(toMap());

  factory RepertorioModel.fromJson(String source) => RepertorioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RepertorioModel(cdRepertoire: $cdRepertoire, cdUser: $cdUser, nmRepertoire: $nmRepertoire, cdBlockMusics: $cdBlockMusics)';
  }

  @override
  bool operator ==(covariant RepertorioModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cdRepertoire == cdRepertoire &&
      other.cdUser == cdUser &&
      other.nmRepertoire == nmRepertoire &&
      listEquals(other.cdBlockMusics, cdBlockMusics);
  }

  @override
  int get hashCode {
    return cdRepertoire.hashCode ^
      cdUser.hashCode ^
      nmRepertoire.hashCode ^
      cdBlockMusics.hashCode;
  }
}
