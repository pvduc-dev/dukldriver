// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Location',
      json,
      ($checkedConvert) {
        final val = Location(
          type: $checkedConvert('type', (v) => v as String?),
          coordinates: $checkedConvert('coordinates',
              (v) => (v as List<dynamic>?)?.map((e) => e as num).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      if (instance.type case final value?) 'type': value,
      if (instance.coordinates case final value?) 'coordinates': value,
    };
