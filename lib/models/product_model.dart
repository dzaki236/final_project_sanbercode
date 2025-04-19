class ProductModel {
  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.isFavorite,
    required this.productImage,
    required this.outlet,
    required this.category,
    required this.rating,
    required this.ratingTotals,
    required this.createdAt,
    required this.id,
  });

  final String? productName;
  final int productPrice;
  final String? productDescription;
  final bool? isFavorite;
  final String? productImage;
  final String? outlet;
  final String? category;
  final String? rating;
  final int? ratingTotals;
  final DateTime? createdAt;
  final String id;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json["product_name"],
      productPrice: json["product_price"],
      productDescription: json["product_description"],
      isFavorite: json["is_favorite"],
      productImage: json["product_image"],
      outlet: json["outlet"],
      category: json["category"],
      rating: json["rating"],
      ratingTotals: json["rating_totals"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
    );
  }

  @override
  String toString() {
    return "$productName, $productPrice, $productDescription, $isFavorite, $ratingTotals, $productImage, $outlet, $category, $rating, $createdAt, $id";
  }
}
