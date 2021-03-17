import 'package:json_annotation/json_annotation.dart';
part 'vegetables.g.dart';
@JsonSerializable()
class Vegetables {
  int bestBefore;
  String code;
  String imageUrl;
  String name;
  int price;
  DateTime productionDate;

  Vegetables();
  Vegetables.name(this.bestBefore, this.code, this.imageUrl, this.name,
      this.price, this.productionDate);

  factory Vegetables.fromJson(Map<String, dynamic> json) => _$VegetablesFromJson(json);
  Map<String, dynamic> toJson() => _$VegetablesToJson(this);
}