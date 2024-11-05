// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallpaperItem _$WallpaperItemFromJson(Map<String, dynamic> json) =>
    WallpaperItem(
      category: json['category'] as String,
      links: (json['links'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WallpaperItemToJson(WallpaperItem instance) =>
    <String, dynamic>{
      'category': instance.category,
      'links': instance.links,
    };
