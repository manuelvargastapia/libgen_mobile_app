import 'package:json_annotation/json_annotation.dart';

part 'download_link_model.g.dart';

@JsonSerializable()
class DownloadLinkModel {
  String url;
  String label;

  DownloadLinkModel(this.url, this.label);

  factory DownloadLinkModel.fromJson(Map<String, dynamic> json) =>
      _$DownloadLinkModelFromJson(json);
}
