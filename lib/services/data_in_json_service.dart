import 'dart:convert';
import 'dart:io';

import 'package:conscious_parser/api/products/dto.dart';

class DataInJsonService {
  static final String dataPath = "data";
  static final String storagePath = "storage.json";

  Future<void> setStorage(StorageModel data) async {
    final jsonString = jsonEncode(data.toJson());
    final file = File(storagePath);

    await checkDirectory(file);

    await file.writeAsString(jsonString);
  }

  Future<StorageModel?> getStorage() async {
    final file = File(storagePath);
    await checkDirectory(file);
    if (await file.exists()) {
      final jsonString = await file.readAsString();
      return StorageModel.fromJson(jsonDecode(jsonString));
    } else {
      return null;
    }
  }

  Future<void> setData(ProductsListModel? data, int page) async {
    final jsonString = jsonEncode(data?.toJson());
    final file = File(dataPath + "/$page.json");
    await checkDirectory(file);
    await file.writeAsString(jsonString);
  }

  Future<ProductsListModel?> getData(int page) async {
    final file = File(dataPath + "/$page.json");
    await checkDirectory(file);
    if (await file.exists()) {
      final jsonString = await file.readAsString();
      return ProductsListModel.fromJson(jsonDecode(jsonString) ?? {});
    } else {
      return null;
    }
  }

  Future<void> checkDirectory(File file) async {
    final directory = file.parent;
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
  }
}
