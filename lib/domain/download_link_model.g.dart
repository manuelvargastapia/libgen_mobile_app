// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadLinkModel _$DownloadLinkModelFromJson(Map<String, dynamic> json) {
  return DownloadLinkModel(
    json['url'] as String,
    json['label'] as String,
  );
}

Map<String, dynamic> _$DownloadLinkModelToJson(DownloadLinkModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
    };
