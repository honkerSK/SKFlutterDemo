// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Computer _$ComputerFromJson(Map<String, dynamic> json) {
  return Computer(
    json['brand'] as String,
    (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ComputerToJson(Computer instance) => <String, dynamic>{
      'brand': instance.brand,
      'price': instance.price,
    };
