import 'dart:convert';

import 'package:main/api/openAi/dto.dart';
import 'package:main/api/products/dto.dart';
import 'package:main/api/request.dart';

class OpenAiRequest {
  final String baseUrl = "api.openai.com";
  late final Request request;

  OpenAiRequest() {
    request = Request(baseUrl, isOpenAi: true);
  }

  Future<NeedWaterModel?> getNeedWater(ProductModel product) async {
    try {
      final body = GptRequestModel(
        messages: [
          MessageModel(role: RoleType.user, content: promptForWater(product))
        ],
        maxTokens: 50,
        temperature: 0.5,
      );

      final response = await request.post(
          body: body.toJson(), endpoint: "v1/chat/completions", isOpenAi: true);

      final chatResponse = ChatResponseModel.fromJson(response);
      return NeedWaterModel.fromJson(
          jsonDecode(chatResponse.choices.first.message.content));
    } catch (e) {
      return null;
    }
  }

  Future<FactsModel?> getFacts(ProductModel product) async {
    try {
      final body = GptRequestModel(
        messages: [
          MessageModel(role: RoleType.system, content: promptForFacts(product))
        ],
        maxTokens: 1000,
        temperature: 0.5,
      );

      final s = jsonEncode(body.toJson());

      final response = await request.post(
          body: jsonDecode(s), endpoint: "v1/chat/completions", isOpenAi: true);

      final chatResponse = ChatResponseModel.fromJson(response);

      return FactsModel.fromJson(
          jsonDecode(chatResponse.choices.first.message.content));
    } catch (e) {
      return null;
    }
  }

  String promptForWater(ProductModel product) =>
      "${(product.name ?? '') + ' - ' + (product.quantity ?? '')}. How much water is used in its production? Please respond only with a JSON object in the following format: {\"needWater\": double}, where \"needWater\" is the amount of water used in production in gallons. Do not include any other text or explanation";

  String promptForFacts(ProductModel product) =>
      "Provide 4 quick and easy facts about ${(product.name ?? '') + ' - ' + (product.quantity ?? '')} regarding its materials, ecology, and quality. Please respond only with a JSON object in the following format: {\"facts\": [\"fact1\", \"fact2\", \"fact3\", \"fact4\"]}. Do not include any other text or explanation.";
}
