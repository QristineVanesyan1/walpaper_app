import 'package:json_annotation/json_annotation.dart';

part 'wallpaper_item.g.dart';

@JsonSerializable()
class WallpaperItem {
  final String category;
  final List<String> links;

  WallpaperItem({
    required this.category,
    required this.links,
  });
  factory WallpaperItem.fromJson(Map<String, dynamic> json) =>
      _$WallpaperItemFromJson(json);

  Map<String, dynamic> toJson() => _$WallpaperItemToJson(this);
}
