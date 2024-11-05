// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affirmation_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AffirmationItem _$AffirmationItemFromJson(Map<String, dynamic> json) =>
    AffirmationItem(
      category: json['category'] as String,
      links: (json['links'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AffirmationItemToJson(AffirmationItem instance) =>
    <String, dynamic>{
      'category': instance.category,
      'links': instance.links,
    };
