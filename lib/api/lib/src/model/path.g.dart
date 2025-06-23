// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Path _$PathFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Path', json, ($checkedConvert) {
      final val = Path(
        type: $checkedConvert('type', (v) => v as String?),
        coordinates: $checkedConvert(
          'coordinates',
          (v) => (v as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>).map((e) => e as num).toList())
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PathToJson(Path instance) => <String, dynamic>{
  if (instance.type case final value?) 'type': value,
  if (instance.coordinates case final value?) 'coordinates': value,
};
