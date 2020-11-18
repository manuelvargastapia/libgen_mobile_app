import 'package:json_annotation/json_annotation.dart';

part 'download_link_model.g.dart';

@JsonSerializable()
class DownloadLinkModel {
  String downloadLink;

  DownloadLinkModel(this.downloadLink);

  factory DownloadLinkModel.fromJson(Map<String, dynamic> json) =>
      _$DownloadLinkModelFromJson(json);
}
