import 'package:json_annotation/json_annotation.dart';

part 'MatchesDetails.g.dart';

@JsonSerializable()
class MatchesDetails {
  final String user_id;
  final String email;
  final String gender;
  final String seeking;
  final String status;
  final String name;
  final String birthday;
  final String birthtime;
  final String country;
  final String city;
  final String planet;
  final String zodiac;
  final String preference;
  final String relationshipstatus;
  final String zodiacicon;
  final String zodiaccard;
  final String profileimage;

  MatchesDetails(
      {this.user_id,
      this.email,
      this.gender,
      this.seeking,
      this.status,
      this.name,
      this.birthday,
      this.birthtime,
      this.country,
      this.city,
      this.planet,
      this.zodiac,
      this.preference,
      this.relationshipstatus,
      this.zodiacicon,
      this.zodiaccard,
      this.profileimage});

  factory MatchesDetails.fromJson(Map<String, dynamic> json) =>
      _$MatchesDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MatchesDetailsToJson(this);
}
