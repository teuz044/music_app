// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class MusicModel {
  int? cdMusic;
  int? cdUser;
  String? nmMusic;
  String? singer;
  String? nmGender;
  MusicModel({
    this.cdMusic,
    this.cdUser,
    this.nmMusic,
    this.singer,
    this.nmGender,
  });

  MusicModel copyWith({
    int? cdMusic,
    int? cdUser,
    String? nmMusic,
    String? singer,
    String? nmGender,
  }) {
    return MusicModel(
      cdMusic: cdMusic ?? this.cdMusic,
      cdUser: cdUser ?? this.cdUser,
      nmMusic: nmMusic ?? this.nmMusic,
      singer: singer ?? this.singer,
      nmGender: nmGender ?? this.nmGender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cdMusic': cdMusic,
      'cdUser': cdUser,
      'nmMusic': nmMusic,
      'singer': singer,
      'nmGender': nmGender,
    };
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      cdMusic: map['cdMusic'] != null ? map['cdMusic'] as int : null,
      cdUser: map['cdUser'] != null ? map['cdUser'] as int : null,
      nmMusic: map['nmMusic'] != null ? map['nmMusic'] as String : null,
      singer: map['singer'] != null ? map['singer'] as String : null,
      nmGender: map['nmGender'] != null ? map['nmGender'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicModel.fromJson(String source) => MusicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MusicModel(cdMusic: $cdMusic, cdUser: $cdUser, nmMusic: $nmMusic, singer: $singer, nmGender: $nmGender)';
  }

  @override
  bool operator ==(covariant MusicModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cdMusic == cdMusic &&
      other.cdUser == cdUser &&
      other.nmMusic == nmMusic &&
      other.singer == singer &&
      other.nmGender == nmGender;
  }

  @override
  int get hashCode {
    return cdMusic.hashCode ^
      cdUser.hashCode ^
      nmMusic.hashCode ^
      singer.hashCode ^
      nmGender.hashCode;
  }
}
