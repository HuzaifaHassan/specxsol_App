class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double regularPrice;
  final double? salePrice;
  final bool isFrameOnly;
  final String brand;
  final String type;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.regularPrice,
    this.salePrice,
    required this.isFrameOnly,
    required this.brand,
    required this.type,
  });
}
