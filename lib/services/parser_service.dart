import 'dart:io';

import 'package:conscious_parser/api/products/dto.dart';
import 'package:conscious_parser/api/products/request.dart';
import 'package:conscious_parser/services/chat_gpt_services.dart';
import 'package:conscious_parser/services/data_in_json_service.dart';

class ParserService {
  final ProductsRequest productsRequest = ProductsRequest();
  final DataInJsonService dataInJsonService = DataInJsonService();
  final DataInJsonService storageInJsonService = DataInJsonService();

  Future<void> start() async {
    print("Parser started\n");
    bool run = true;
    final int pageSize = 10;

    while (run) {
      int? page = ((await storageInJsonService.getStorage())?.page ?? 0) + 1;
      stdout.write("\x1B\[\1\A"); // Перемещение курсора на строку вверх
      stdout.write("\x1B\[\K"); // Очистка строки
      stdout.write(page);
      await storageInJsonService.setStorage(StorageModel(page: page));
      final products = await storageInJsonService.getData(page) ??
          ProductsListModel(products: [], page: page);

      final productsFromApi =
          await productsRequest.getProducts(page, pageSize: pageSize);

      for (final ProductResponseModel p in productsFromApi?.products ?? []) {
        ProductModel product =
            await ChatGptServices(product: p.toProductModel(p))
                .addInformationFromChatGpt();

        if (!isFileExistOrNot(product, products)) {
          products.products?.add(product);
        }
        await productsRequest.uploadProduct(product);
        await productsRequest.uploadProduct(product);

        stdout.write("\x1B\[\1\A"); // Перемещение курсора на строку вверх
        stdout.write("\x1B\[\K"); // Очистка строки
        stdout.write(
            "Product Name: ${product.name} - Id: ${product.id}\n");
      }

      await dataInJsonService.setData(products, page);

      if (page == 110) {
        run = false;
      }
    }
  }

  Future<ProductModel?> getProduct(dynamic id) async {
    final p = await productsRequest.getProduct(id);
    if (p == null) return null;
    ProductModel product = await ChatGptServices(product: p.toProductModel(p))
        .addInformationFromChatGpt();

    await productsRequest.uploadProduct(product);
    return product;
  }

  bool isFileExistOrNot(ProductModel product, ProductsListModel data) {
    return (data.products ?? []).any((p) => p.id == product.id);
  }
}
