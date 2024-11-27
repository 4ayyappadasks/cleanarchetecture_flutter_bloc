import 'package:cleanarchetectureflutterguy/Domain/homepage/entity.dart';

class Homepagemodel extends Homepageentity {
  Homepagemodel({
    required products,
    required total,
    required skip,
    required limit,
  }) : super(
          total: total,
          skip: skip,
          limit: limit,
          products: products,
        );
  factory Homepagemodel.fromJson(Map<String, dynamic> json) => Homepagemodel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );
}
