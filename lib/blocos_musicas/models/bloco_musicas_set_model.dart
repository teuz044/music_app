// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class BlocoMusicasSetModel {
   String? nmBlockMusic;
  int? cdRepertoire;
  int? cdUser;
  BlocoMusicasSetModel({
    this.nmBlockMusic,
    this.cdRepertoire,
    this.cdUser,
  });

  BlocoMusicasSetModel copyWith({
    String? nmBlockMusic,
    int? cdRepertoire,
    int? cdUser,
  }) {
    return BlocoMusicasSetModel(
      nmBlockMusic: nmBlockMusic ?? this.nmBlockMusic,
      cdRepertoire: cdRepertoire ?? this.cdRepertoire,
      cdUser: cdUser ?? this.cdUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nmBlockMusic': nmBlockMusic,
      'cdRepertoire': cdRepertoire,
      'cdUser': cdUser,
    };
  }

  factory BlocoMusicasSetModel.fromMap(Map<String, dynamic> map) {
    return BlocoMusicasSetModel(
      nmBlockMusic: map['nmBlockMusic'] != null ? map['nmBlockMusic'] as String : null,
      cdRepertoire: map['cdRepertoire'] != null ? map['cdRepertoire'] as int : null,
      cdUser: map['cdUser'] != null ? map['cdUser'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlocoMusicasSetModel.fromJson(String source) => BlocoMusicasSetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BlocoMusicasSetModel(nmBlockMusic: $nmBlockMusic, cdRepertoire: $cdRepertoire, cdUser: $cdUser)';

  @override
  bool operator ==(covariant BlocoMusicasSetModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.nmBlockMusic == nmBlockMusic &&
      other.cdRepertoire == cdRepertoire &&
      other.cdUser == cdUser;
  }

  @override
  int get hashCode => nmBlockMusic.hashCode ^ cdRepertoire.hashCode ^ cdUser.hashCode;
}
