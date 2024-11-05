import 'package:json_annotation/json_annotation.dart';

part 'affirmation_item.g.dart';

@JsonSerializable()
class AffirmationItem {
  final String category;
  final List<String> links;

  AffirmationItem({
    required this.category,
    required this.links,
  });
  factory AffirmationItem.fromJson(Map<String, dynamic> json) =>
      _$AffirmationItemFromJson(json);

  Map<String, dynamic> toJson() => _$AffirmationItemToJson(this);
}
