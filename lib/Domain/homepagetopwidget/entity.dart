class Topwidgetentity {
  List<Product> products;
  int total;
  int skip;
  int limit;

  Topwidgetentity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

}

class Product {
  int id;
  String title;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.images,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    images: List<String>.from(json["images"].map((x) => x)),
  );
}
