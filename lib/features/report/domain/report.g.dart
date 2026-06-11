// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      category: $enumDecode(_$ReportCategoryEnumMap, json['category']),
      description: json['description'] as String,
      photoUrl: json['photoUrl'] as String,
      location: LatLng.fromJson(json['location'] as Map<String, dynamic>),
      geohash: json['geohash'] as String,
      status: $enumDecodeNullable(_$ReportStatusEnumMap, json['status']) ??
          ReportStatus.pending,
      createdAt: DateTime.parse(json['createdAt'] as String),
      deviceHash: json['deviceHash'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'category': _$ReportCategoryEnumMap[instance.category]!,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'location': instance.location,
      'geohash': instance.geohash,
      'status': _$ReportStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'deviceHash': instance.deviceHash,
      'address': instance.address,
    };

const _$ReportCategoryEnumMap = {
  ReportCategory.iluminacao: 'iluminacao',
  ReportCategory.asfalto: 'asfalto',
  ReportCategory.lixo: 'lixo',
  ReportCategory.alagamento: 'alagamento',
  ReportCategory.outro: 'outro',
};

const _$ReportStatusEnumMap = {
  ReportStatus.pending: 'pending',
  ReportStatus.inReview: 'inReview',
  ReportStatus.resolved: 'resolved',
};
