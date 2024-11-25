// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

@JsonSerializable()
class GptRequestModel {
  String model;
  List<MessageModel> messages;
  @JsonKey(name: 'max_tokens')
  int maxTokens;
  double temperature;

  GptRequestModel({
    this.model = "gpt-4o-mini",
    required this.messages,
    required this.maxTokens,
    required this.temperature,
  });

  factory GptRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GptRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GptRequestModelToJson(this);
}

@JsonSerializable()
class MessageModel {
  RoleType role;
  String content;

  MessageModel({
    required this.role,
    required this.content,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}

@JsonSerializable()
class NeedWaterModel {
  double needWater;

  NeedWaterModel({
    required this.needWater,
  });

  factory NeedWaterModel.fromJson(Map<String, dynamic> json) =>
      _$NeedWaterModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeedWaterModelToJson(this);
}

@JsonSerializable()
class FactsModel {
  List<String> facts;

  FactsModel({
    required this.facts,
  });

  factory FactsModel.fromJson(Map<String, dynamic> json) =>
      _$FactsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactsModelToJson(this);
}

@JsonSerializable()
class ChatResponseModel {
  final List<ChoiceModel> choices;

  ChatResponseModel({required this.choices});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseModelToJson(this);
}

@JsonSerializable()
class ChoiceModel {
  final MessageModel message;

  ChoiceModel({required this.message});

  factory ChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ChoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceModelToJson(this);
}

enum RoleType {
  user,
  assistant,
  system,
}
