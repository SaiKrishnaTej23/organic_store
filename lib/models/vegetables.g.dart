// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetables.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vegetables _$VegetablesFromJson(Map<String, dynamic> json) {
  return Vegetables()
    ..bestBefore = json['bestBefore'] as int
    ..code = json['code'] as String
    ..imageUrl = json['imageUrl'] as String
    ..name = json['name'] as String
    ..price = json['price'] as int
    ..productionDate = json['productionDate'] == null
        ? null
        : DateTime.parse(json['productionDate'] as String);
}

Map<String, dynamic> _$VegetablesToJson(Vegetables instance) =>
    <String, dynamic>{
      'bestBefore': instance.bestBefore,
      'code': instance.code,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'price': instance.price,
      'productionDate': instance.productionDate?.toIso8601String(),
    };
