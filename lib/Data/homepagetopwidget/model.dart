import 'package:cleanarchetectureflutterguy/Domain/homepagetopwidget/entity.dart';

class Topwidgetmodel extends Topwidgetentity {
  Topwidgetmodel({
    required products,
    required total,
    required skip,
    required limit,
  }) : super(
          products: products,
          limit: limit,
          skip: skip,
          total: total,
        );

  factory Topwidgetmodel.fromJson(Map<String, dynamic> json) => Topwidgetmodel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}
