// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptRequestModel _$GptRequestModelFromJson(Map<String, dynamic> json) =>
    GptRequestModel(
      model: json['model'] as String? ?? "gpt-4o-mini",
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxTokens: (json['max_tokens'] as num).toInt(),
      temperature: (json['temperature'] as num).toDouble(),
    );

Map<String, dynamic> _$GptRequestModelToJson(GptRequestModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
      'max_tokens': instance.maxTokens,
      'temperature': instance.temperature,
    };

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      role: $enumDecode(_$RoleTypeEnumMap, json['role']),
      content: json['content'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'role': _$RoleTypeEnumMap[instance.role]!,
      'content': instance.content,
    };

const _$RoleTypeEnumMap = {
  RoleType.user: 'user',
  RoleType.assistant: 'assistant',
  RoleType.system: 'system',
};

NeedWaterModel _$NeedWaterModelFromJson(Map<String, dynamic> json) =>
    NeedWaterModel(
      needWater: (json['needWater'] as num).toDouble(),
    );

Map<String, dynamic> _$NeedWaterModelToJson(NeedWaterModel instance) =>
    <String, dynamic>{
      'needWater': instance.needWater,
    };

FactsModel _$FactsModelFromJson(Map<String, dynamic> json) => FactsModel(
      facts: (json['facts'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FactsModelToJson(FactsModel instance) =>
    <String, dynamic>{
      'facts': instance.facts,
    };

ChatResponseModel _$ChatResponseModelFromJson(Map<String, dynamic> json) =>
    ChatResponseModel(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatResponseModelToJson(ChatResponseModel instance) =>
    <String, dynamic>{
      'choices': instance.choices,
    };

ChoiceModel _$ChoiceModelFromJson(Map<String, dynamic> json) => ChoiceModel(
      message: MessageModel.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChoiceModelToJson(ChoiceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
