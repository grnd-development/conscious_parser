import 'package:main/api/products/dto.dart';
import 'package:main/api/request.dart';

class ProductsRequest {
  final String openFoodFactsUrl = "world.openfoodfacts.org";
  final String baseUrl = "18.216.208.234";
  late final Request openFoodFactsRequest;
  late final Request baseRequest;

  ProductsRequest() {
    openFoodFactsRequest = Request(openFoodFactsUrl, isOpenFoodFacts: true);
    baseRequest = Request(baseUrl, isHttps: false);
  }

  //GET PRODUCTS
  Future<ProductsListResponseModel?> getProducts(int page,
      {int pageSize = 10}) async {
    final queries = {
      "countries_tags": "united-states",
      "page": page.toString(),
      "page_size": pageSize.toString(),
    };

    final response = await openFoodFactsRequest.get(
        endpoint: "api/v2/search", queryParameters: queries);
    return ProductsListResponseModel.fromJson(response);
  }

  //GET PRODUCT
  Future<ProductResponseModel?> getProduct(String id) async {
    final response =
        await openFoodFactsRequest.get(endpoint: "api/v2/product/$id");
    return ProductResponseModel.fromJson(response);
  }

  //UPLOAD PRODUCT
  Future<dynamic> uploadProduct(ProductModel product) async {
    final ResponseModel? response =
        await baseRequest.post(endpoint: "api/product", body: product.toJson());

    if (response == null) return null;
    if ((response.errors ?? "")
        .toString()
        .contains("The barcode has already been taken.")) {
      return await updateProduct(product);
    }
    if (response.errors != null) {
      print("Upload error: ${response.errors.toString()}");
    }
    if (response.data == null) return null;

    return ProductModel.fromJson(response.data);
  }

  //UPDATE PRODUCT
  Future<dynamic> updateProduct(ProductModel product) async {
    final ResponseModel? response = await baseRequest.put(
        endpoint: "api/product/${product.id}", body: product.toJson());

    if (response == null) return null;
    if (response.errors != null) {
      print("Update error: ${response.errors.toString()}");
    }
    if (response.data == null) return null;

    return ProductModel.fromJson(response.data);
  }
}
