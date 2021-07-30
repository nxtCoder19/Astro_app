// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MatchesDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchesDetails _$MatchesDetailsFromJson(Map<String, dynamic> json) {
  return MatchesDetails(
    user_id: json['user_id'] as String,
    email: json['email'] as String,
    gender: json['gender'] as String,
    seeking: json['seeking'] as String,
    status: json['status'] as String,
    name: json['name'] as String,
    birthday: json['birthday'] as String,
    birthtime: json['birthtime'] as String,
    country: json['country'] as String,
    city: json['city'] as String,
    planet: json['planet'] as String,
    zodiac: json['zodiac'] as String,
    preference: json['preference'] as String,
    relationshipstatus: json['relationshipstatus'] as String,
    zodiacicon: json['zodiacicon'] as String,
    zodiaccard: json['zodiaccard'] as String,
    profileimage: json['profileimage'] as String,
  );
}

Map<String, dynamic> _$MatchesDetailsToJson(MatchesDetails instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'email': instance.email,
      'gender': instance.gender,
      'seeking': instance.seeking,
      'status': instance.status,
      'name': instance.name,
      'birthday': instance.birthday,
      'birthtime': instance.birthtime,
      'country': instance.country,
      'city': instance.city,
      'planet': instance.planet,
      'zodiac': instance.zodiac,
      'preference': instance.preference,
      'relationshipstatus': instance.relationshipstatus,
      'zodiacicon': instance.zodiacicon,
      'zodiaccard': instance.zodiaccard,
      'profileimage': instance.profileimage,
    };
