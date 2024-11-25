import 'dart:convert';

import 'package:conscious_parser/api/openAi/request.dart';
import 'package:conscious_parser/api/products/dto.dart';

class ChatGptServices {
  final ProductModel product;

  ChatGptServices({required this.product});

  Future<ProductModel> addInformationFromChatGpt() async {
    await getNeedWater();
    await getFacts();
    getMiles();

    return product;
  }

  Future<void> getNeedWater() async {
    final needWater = await OpenAiRequest().getNeedWater(product);
    product.needWater = needWater?.needWater ?? null;
  }

  Future<void> getFacts() async {
    final facts = await OpenAiRequest().getFacts(product);
    product.facts = jsonEncode(facts?.facts ?? null);
  }

  void getMiles() async {
    if (product.co2Total == null) {
      product.miles = null;
      return;
    }
    product.miles = double.parse(
        ((product.co2Total ?? 0) / 193.85 / 1.6).toStringAsFixed(2));
  }
}
